# Maintainer: Joshua Webb <joshwebb84@outlook.com>
pkgname=blend-update-git
pkgver=r29.abcdef0
pkgrel=1
pkgdesc="Simple script for BlendOS for automatic updates"
arch=('any')
url="https://github.com/tohurtv/blend-update"
license=('MIT')
depends=('notify-send.py')
makedepends=('git')
source=("git+https://github.com/tohurtv/blend-update.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/blend-update"
  # Generate version string based on the latest commit
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/blend-update"

  # Install main scripts
  install -Dm755 blend-update "$pkgdir/usr/bin/blend-update"
  install -Dm755 blend-update-notify "$pkgdir/usr/bin/blend-update-notify"

  # Install systemd service and timer
  install -Dm644 blend-update.service "$pkgdir/usr/lib/systemd/system/blend-update.service"
  install -Dm644 blend-update.timer "$pkgdir/usr/lib/systemd/system/blend-update.timer"
}

post_install() {
  echo "Enabling and starting blend-update.timer..."
  systemctl enable --now blend-update.timer
}
