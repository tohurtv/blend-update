#!/usr/bin/env bash

set -e

GITHUB_USER="tohurtv"
REPO_NAME="blend-update"
BRANCH="main"
RAW_BASE_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/$BRANCH"

# File paths
SCRIPT_PATH="/usr/local/bin/blend-update"
SERVICE_PATH="/etc/systemd/system/blend-update.service"
TIMER_PATH="/etc/systemd/system/blend-update.timer"

download_if_missing() {
  local name=$1
  local dest=$2

  if [[ -f "$dest" ]]; then
    echo "✓ $name already exists at $dest"
  else
    echo "⏬ Downloading $name..."
    curl -fsSL "$RAW_BASE_URL/$name" -o "$dest"
  fi
}

# Download and install if missing
download_if_missing "blend-update.sh" "$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"

download_if_missing "blend-update.service" "$SERVICE_PATH"
download_if_missing "blend-update.timer" "$TIMER_PATH"

# Reload and enable the timer
echo "🔄 Reloading systemd and enabling timer..."
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable --now blend-update.timer

echo "✅ blend-update installed and scheduled successfully!"
