# blend-update

A simple update notifier script for [BlendOS](https://blendos.co/) users who prefer a scheduled, hands-off update experience.

This script automates `akshara update`, monitors for failure, and sends persistent desktop notifications via `kdialog` (for KDE Plasma) or `zenity` (for GNOME or GTK-based desktop environments). After a successful update, the user is prompted to reboot or defer. It runs weekly via a systemd timer, scheduled for **every Thursday at 12:00 AM** by default.

## Features

- Automates `akshara update`
- Detects and notifies on update failures
- Uses `kdialog` (KDE) or `zenity` (GTK) for persistent notifications
- Offers reboot prompt after a successful update
- Runs weekly via systemd timer
- Self-installing with auto-setup for convenience

## Prerequisites

- BlendOS with a desktop environment installed
- `kdialog` (for KDE) or `zenity` (for GNOME/GTK)

Make sure the appropriate notifier is listed in your `system.yaml` if not already present.

## Installation

Install the script manually with:

```bash
curl -sSL https://raw.githubusercontent.com/tohurtv/blend-update/main/install.sh | bash
```
Or add it to your system.yaml for automatic inclusion in your BlendOS image:

```yaml
packages:
  - 'kdialog'  # For KDE Plasma users
  - 'zenity'   # For GNOME or GTK-based DEs

commands:
  - 'curl -sSL https://raw.githubusercontent.com/tohurtv/blend-update/main/install.sh | bash'
```
