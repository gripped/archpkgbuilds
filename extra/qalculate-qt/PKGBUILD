# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qalculate-qt
pkgver=5.7.0
pkgrel=1
pkgdesc='Qt frontend for libqalculate'
arch=(x86_64)
url='https://qalculate.github.io/'
license=(GPL-2.0-only)
depends=(gcc-libs
         glibc
         libqalculate
         qt6-base
         qt6-svg)
makedepends=(git
             qt6-tools)
source=(git+https://github.com/Qalculate/qalculate-qt#tag=v$pkgver)
sha256sums=('cc74cc41c7b6d368822e1fe864e75c82f989e09b2923bc41fcc8654761ccef38')

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
