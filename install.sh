#!/usr/bin/env bash

set -e

# Define install locations
SCRIPT_PATH="/usr/local/bin/blend-update"
SERVICE_PATH="/etc/systemd/system/blend-update.service"
TIMER_PATH="/etc/systemd/system/blend-update.timer"

# GitHub repo base URL (raw)
BASE_URL="https://raw.githubusercontent.com/tohurtv/blend-update/main"

# Download and overwrite the update script
echo "Installing blend-update script..."
curl -sSL "${BASE_URL}/blend-update" -o "$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"

# Download and overwrite the service file
echo "Installing systemd service..."
curl -sSL "${BASE_URL}/blend-update.service" -o "$SERVICE_PATH"

# Download and overwrite the timer file
echo "Installing systemd timer..."
curl -sSL "${BASE_URL}/blend-update.timer" -o "$TIMER_PATH"

# Reload systemd daemon to pick up new/updated units
echo "Reloading systemd daemon..."
systemctl daemon-reexec
systemctl daemon-reload

# Enable and start the timer
echo "Enabling and starting the update timer..."
systemctl enable --now blend-update.timer

echo "✅ blend-update has been installed and scheduled. You're all set!"
