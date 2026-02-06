#! /usr/bin/env bash
#========================
###### DevOps Tool ######
### BY : Fouad Yasser ###
#========================

set -euo pipefail


source ./functions.sh
source ./firewall.sh
source ./user.sh

#========================
# Defaults
#========================
PKG_MANAGER=""
ENV="dev"
USERNAME="devops"
INSTALL_MONITORING=false

#========================
# Usage
#========================
usage() {
  echo -e "\e[31mUsage:\e[0m"
  echo -e "\e[33m./bootstrap.sh ( --prod | --dev ) --user USER --monitoring\e[0m"
  exit 1
}

#========================
# Parse Arguments
#========================
while [ "$#" -gt 0 ]; do 
  case $1 in 
    --prod) ENV=prod; shift ;;
    --dev) ENV=dev; shift ;;
    --user) USERNAME="$2"; shift 2 ;;
    --monitoring) INSTALL_MONITORING=true; shift ;;
    *) usage ;;
  esac
done

#========================
# Check root
#========================
if [[ "$EUID" -ne 0 ]]; then
  err "Run as root or with sudo"
fi

log "Starting bootstrap in '$ENV' mode..."

#===========================
# Detect OS & update system
#===========================
if [[ -f /etc/debian_version ]]; then
   log "Debian/Ubuntu detected"
   PKG_MANAGER="apt"
   log "Updating packages..."
   apt update -y && apt upgrade -y
elif [[ -f /etc/redhat-release ]]; then
   log "RHEL/CentOS detected"
   PKG_MANAGER="dnf"
   log "Updating packages..."
   dnf update -y && dnf upgrade -y
else
   err "Unsupported OS"
fi

#==========================
# Install essential packages
#===========================
log "Installing base packages..."

if [[ "$PKG_MANAGER" == "dnf" ]]; then
  dnf install -y git curl wget ufw nginx docker docker-compose
elif [[ "$PKG_MANAGER" == "apt" ]]; then
  apt install -y git curl wget ufw nginx docker.io docker-compose
fi

# Enable and start docker
systemctl enable docker
systemctl start docker 

#========================
###### Create user ######
#========================
create_user "$USERNAME"

#========================
########firewall#########
#========================
firewall

log "=======Bootstrap completed successfully!========="

echo ""
echo "================================================"
echo " Server Ready "
echo " User: $USERNAME"
echo " Env : $ENV"
echo " Docker + Nginx installed"
echo " Firewall enabled"
echo "================================================"

