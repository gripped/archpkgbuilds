# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qalculate-qt
pkgver=5.11.0
pkgrel=1
pkgdesc='Qt frontend for libqalculate'
arch=(x86_64)
url='https://qalculate.github.io/'
license=(GPL-2.0-only)
depends=(glibc
         libgcc
         libqalculate
         libstdc++
         qt6-base
         qt6-svg)
makedepends=(git
             qt6-tools)
source=(git+https://github.com/Qalculate/qalculate-qt#tag=v$pkgver)
sha256sums=('ffb0d404551b1c42586d848839f5479893627869900b9beee143cd789bd4f20a')

build() {
  cd $pkgname
  qmake6 \
    PREFIX=/usr
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
}
