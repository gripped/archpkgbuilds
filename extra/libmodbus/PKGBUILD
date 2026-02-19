# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=libmodbus
pkgver=3.1.12
pkgrel=1
pkgdesc='A Modbus library for Linux, Mac OS, FreeBSD and Windows'
arch=(x86_64)
url=https://github.com/stephane/libmodbus
license=(LGPL-2.1-or-later)
depends=(glibc)
makedepends=(git)
source=("git+$url#tag=v$pkgver")
b2sums=('fc9d52a64fd2eb0edab1d51610fefd34395a697dd2df76dc9c68785422036ec2d2588be1bd2a32e0d271126587ef5e02b0065eea193593df794a6dc470706d2a')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
