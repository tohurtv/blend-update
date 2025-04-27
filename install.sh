#!/usr/bin/env bash

set -e

# Define install locations
SCRIPT_PATH="/usr/local/bin/blend-update"
NOTIFY_SCRIPT_PATH="/usr/local/bin/blend-update-notify"
SERVICE_PATH="/etc/systemd/system/blend-update.service"
TIMER_PATH="/etc/systemd/system/blend-update.timer"

# GitHub repo base URL (raw)
BASE_URL="https://raw.githubusercontent.com/tohurtv/blend-update/main"

# Optional: Accept custom timer interval as argument
CUSTOM_INTERVAL="$1"

# Download and overwrite the update script
echo "Installing blend-update script..."
curl -sSL "${BASE_URL}/blend-update" -o "$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"

echo "Installing blend-update-notify script..."
curl -sSL "${BASE_URL}/blend-update-notify" -o "$NOTIFY_SCRIPT_PATH"
chmod +x "$NOTIFY_SCRIPT_PATH"

# Download and overwrite the service file
echo "Installing systemd service..."
curl -sSL "${BASE_URL}/blend-update.service" -o "$SERVICE_PATH"

# Handle timer file: custom or from repo
if [[ -n "$CUSTOM_INTERVAL" ]]; then
  echo "Creating custom timer with interval: $CUSTOM_INTERVAL"
  cat <<EOF > "$TIMER_PATH"
[Unit]
Description=Run blend-update at custom interval

[Timer]
OnCalendar=$CUSTOM_INTERVAL
Persistent=true

[Install]
WantedBy=timers.target
EOF
else
  echo "Installing systemd timer from repo..."
  curl -sSL "${BASE_URL}/blend-update.timer" -o "$TIMER_PATH"
fi

# Reload systemd daemon to pick up new/updated units
echo "Reloading systemd daemon..."
systemctl daemon-reexec
systemctl daemon-reload

# Enable and start the timer
echo "Enabling and starting the update timer..."
systemctl enable blend-update.timer

echo "✅ blend-update has been installed and scheduled. You're all set!"
