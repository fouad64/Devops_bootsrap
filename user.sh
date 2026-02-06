#!/usr/bin/env bash
# user.sh

create_user() {
  local USERNAME="$1"

  if id "$USERNAME" &>/dev/null; then
    log "User '$USERNAME' already exists, skipping creation."
  else
    log "Creating user '$USERNAME' with password login..."
    useradd -m -s /bin/bash "$USERNAME"

    echo "Please enter password for user '$USERNAME':"
    passwd "$USERNAME"

    usermod -aG sudo,docker "$USERNAME"
  fi
}

