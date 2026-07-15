# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qalculate-qt
pkgver=5.12.0
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
sha256sums=('d83f81cd939759f51ae568863f792df161495b905ad289c72ec1f959b516bdfe')

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
