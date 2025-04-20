# blend-update

A simple update notifier script for [BlendOS](https://blendos.co/) users who prefer a scheduled, hands-off update experience.

This script automates `akshara update`, monitors for failure, and sends persistent desktop notifications via `kdialog` on plasma or zenity if on GNOME or GTK based DEs. After a successful update, the user is given the option to reboot or defer. It runs weekly via a systemd timer, scheduled for **every Thursday at 12:00 AM** by default.

## Features

- Automates `akshara update`
- Detects and notifies on update failures
- Uses `kdialog` or `zenity` for persistent notifications
- Offers reboot prompt after a successful update
- Runs weekly via systemd timer
- Self-installing with auto-setup for convenience

## Prerequisites

- BlendOS with GNOME, KDE or other DEs.
- `kdialog` or `zenity` installed (see usage below)

## Installation

Install the script with:

```bash
curl -sSL https://raw.githubusercontent.com/tohurtv/blend-update/main/install.sh | bash
```
Or in your system.yaml with

```yaml
packages:
  - kdialog  # Required for KDE notifications
  - zenity   # Required for other DEs

commands:
  - curl -sSL https://raw.githubusercontent.com/tohurtv/blend-update/main/install.sh | bash
```
