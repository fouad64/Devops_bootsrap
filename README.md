# DevOps Bootstrap Script

**Author:** Fouad Yasser  
**Purpose:** Automated server bootstrap setup for Linux environments with essential DevOps tools, user management, and security hardening.

---

## Overview

This Bash automation script streamlines the initial setup of fresh Linux servers for DevOps and Cloud Engineering workflows. It provides a consistent, repeatable server configuration process with security best practices built-in.

### What It Does

- **System Management:** Updates and upgrades the system packages
- **Essential Tools:** Installs git, curl, Docker, Docker Compose, nginx, and UFW firewall
- **User Management:** Creates a non-root user with sudo privileges and password authentication
- **Security:** Configures UFW firewall with sensible defaults
- **Container Runtime:** Sets up and enables Docker service
- **Flexible Modes:** Supports development and production environments
- **Extensible:** Built-in hooks for monitoring agents and future enhancements

---

##  Features

-  **Multi-Distribution Support:** Works on Ubuntu/Debian (apt) and RHEL/CentOS (dnf)
-  **Intelligent OS Detection:** Automatically selects the appropriate package manager
-  **CLI Interface:** Simple command-line options for customization
-  **Modular Architecture:** Functions separated into logical files for easy maintenance
-  **Production Ready:** Designed with security and best practices in mind
-  **Extensible Design:** Easy to add monitoring, backups, or deployment automation

---

##  Quick Start

### 1. Clone the Repository
git clone https://github.com/yourusername/devops-bootstrap.git
cd devops-bootstrap

### 2. Make the Script Executable
chmod +x bootstrap.sh

### 3. Run the Bootstrap Script
**Production mode with monitoring:**
sudo ./bootstrap.sh --prod --user yourusername --monitoring

**Development mode:**
sudo ./bootstrap.sh --dev --user devops

---


### Examples

# Production server with custom user
sudo ./bootstrap.sh --prod --user admin

# Development environment with monitoring enabled
sudo ./bootstrap.sh --dev --user developer --monitoring

# Minimal production setup
sudo ./bootstrap.sh --prod --user ops

---

##  Project Structure

devops-bootstrap/
├── bootstrap.sh      # Main orchestration script
├── functions.sh      # Logging and utility functions
├── firewall.sh       # UFW firewall configuration
├── user.sh           # User creation and management
└── README.md         # This file

### File Descriptions

- **`bootstrap.sh`** — Entry point that orchestrates the entire setup process
- **`functions.sh`** — Reusable logging utilities and helper functions
- **`firewall.sh`** — Configures UFW firewall with default deny/allow rules
- **`user.sh`** — Handles secure user creation with sudo privileges

---

##  System Requirements

- **Operating System:** Ubuntu 18.04+, Debian 10+, RHEL 8+, or CentOS 8+
- **Shell:** Bash 4.0 or higher
- **Privileges:** Root access (via sudo)
- **Network:** Internet connectivity for package downloads

---

##  Security Features

- Non-root user creation with sudo access
- UFW firewall enabled by default
- Password authentication setup for created users
- Docker socket permissions properly configured
- System packages updated before installation

---

##  Future Enhancements

- [ ] Monitoring agent integration (Prometheus Node Exporter, Datadog, etc.)
- [ ] Automated backup configuration
- [ ] SSH key-based authentication setup
- [ ] Fail2ban installation and configuration
- [ ] Custom Docker network setup
- [ ] Log aggregation setup
- [ ] Health check scripts

---

##  Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

---
