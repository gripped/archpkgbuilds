# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qalculate-qt
pkgver=5.9.0.1
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
sha256sums=('43b2139c94546d504a473e9cda3f3cb38b7aed15e6e3e3d399d244d2b79d7d35')

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
