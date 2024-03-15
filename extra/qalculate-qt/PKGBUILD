# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qalculate-qt
pkgver=5.0.0
pkgrel=2
pkgdesc='Qt frontend for libqalculate'
arch=(x86_64)
url='https://qalculate.github.io/'
license=(GPL-2.0-only)
depends=(gcc-libs
         glibc
         libqalculate
         qt6-base
         qt6-svg)
makedepends=(qt6-tools)
source=(https://github.com/Qalculate/qalculate-qt/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4143033faba2851de992dc7da96a81362b11a447256b0df7cbc0fbfabbd34408')

build() {
  cd $pkgname-$pkgver
  qmake6 \
    PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
