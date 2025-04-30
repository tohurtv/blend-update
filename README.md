# blend-update
![Screenshot](https://raw.githubusercontent.com/tohurtv/blend-update/refs/heads/main/assets/Screenshot.png "Screenshot")

A simple updater and notifier script for [BlendOS](https://blendos.co/) users who prefer a scheduled, hands-off update experience.

This script automates `akshara update`, monitors for failure, and sends persistent desktop notifications via `notify-send.py`. After a successful update, the user is prompted to reboot or defer. It runs weekly via a systemd timer, scheduled for **every Thursday at 12:00 AM** by default.

## Features

- Automates `akshara update`
- Detects and notifies on update failures
- Uses `notify-send.py` for persistent notifications
- Offers reboot prompt after a successful update
- Runs weekly via systemd timer
- Self-installing with auto-setup for convenience

## Prerequisites

- BlendOS with a desktop environment installed
- `notify-send.py` aur package installed

Make sure `notify-send.py` listed in your `system.yaml` aur-packages if not already present.

## Installation

Add it to your system.yaml for automatic inclusion in your BlendOS build:

```yaml
aur-packages:
  - 'notify-send-py'

commands:
  - 'curl -sSL https://raw.githubusercontent.com/tohurtv/blend-update/main/install.sh | bash'
```
 Or add it to your system.yaml with a custom time
```yaml
aur-packages:
  - 'notify-send-py'

commands:
  - 'curl -sSL https://raw.githubusercontent.com/tohurtv/blend-update/main/install.sh | bash -s -- "Mon,Fri 12:00"'
```
