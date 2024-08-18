# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=debootstrap
pkgver=1.0.137
pkgrel=1
pkgdesc="Bootstrap a basic Debian system"
arch=('any')
license=('GPL')
url="https://tracker.debian.org/pkg/debootstrap"
depends=('distro-info' 'perl' 'wget')
makedepends=('git')
source=(git+https://salsa.debian.org/installer-team/debootstrap.git#tag=$pkgver
        arch-detect.patch)
optdepends=('gnupg: check release signatures'
            'debian-archive-keyring: check release signatures for Debian'
            'debian-ports-archive-keyring: check release signatures for Debian Ports'
            'ubuntu-keyring: check release signatures for Ubuntu')
sha512sums=('7eb537510c6b05751a413ef32d255f7479dbbccc6702e503ecf00d71cfa17e225981fb6f04c851f5ec9b162df8631d29e3dd75789d0c3d63493375b179496986'
            'b1fdff6142326c2a5075e457181a85cb2a37848c777f128f4c0eb3740980784d25d4f143a76b97c90ef252463cc5d8bd0797b2544c27b6dd8e05a6258a6b0c02')

prepare() {
  cd debootstrap

  sed -i 's/sbin/bin/g' Makefile

  # Debian defaults
  sed -i 's|export PATH|export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"|' debootstrap

  # Detect Architecture
  patch -p0 -i ../arch-detect.patch
}

package() {
  cd debootstrap
  make DESTDIR="$pkgdir" install

  install -Dm644 debootstrap.8 "$pkgdir"/usr/share/man/man8/debootstrap.8
}
