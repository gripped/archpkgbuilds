# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=ell
pkgver=0.68
pkgrel=1
pkgdesc="Embedded Linux library"
arch=(x86_64)
url="https://01.org/ell"
#url="https://git.kernel.org/pub/scm/libs/ell/ell.git/"
license=('LGPL-2.1-or-later')
depends=('gcc-libs' 'glibc')
checkdepends=('dbus' 'procps-ng')
# https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
source=(https://mirrors.edge.kernel.org/pub/linux/libs/$pkgname/$pkgname-$pkgver.tar.{xz,sign})
sha256sums=('ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125'
            'SKIP')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659') # "Marcel Holtmann <marcel@holtmann.org>"

prepare() {
  cd "$pkgname-$pkgver"
  # don't run tests that fail in chroot build whith
  # "Failed to start message bus: Failed to bind socket "0.0.0.0" port 140"
  # unit/test-dbus-message-fds
  # unit/test-dbus-properties
  sed -i "217d;220d" Makefile.am
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
 ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
