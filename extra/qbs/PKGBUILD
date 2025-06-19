# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Donald Carr <sirspudd@gmail.com>
# Contributor: Jake Petroules <jake.petroules@qt.io>

pkgname=qbs
pkgver=3.0.0
pkgrel=1
pkgdesc='Cross platform build tool'
arch=(x86_64)
url='https://wiki.qt.io/Qbs'
license=(LGPL-2.1-only)
depends=(gcc-libs
         glibc
         qt6-base
         qt6-5compat)
makedepends=(cmake
             git)
source=(git+https://code.qt.io/qbs/qbs#tag=v$pkgver)
sha256sums=('6efe613bf13c63b4d3acc93cef915fc02aebc22cc2b0be18450557aaad059295')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_TESTS=OFF \
    -DQBS_LIBEXEC_INSTALL_DIR=lib/qbs
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
