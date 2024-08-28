# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libultrahdr
pkgver=1.1.1
pkgrel=1
pkgdesc='The reference codec for the Ultra HDR format'
arch=(x86_64)
url='https://github.com/google/libultrahdr'
license=(Apache-2.0)
depends=(gcc-libs
         glibc
         libglvnd
         libjpeg-turbo)
makedepends=(cmake
             git)
source=(git+https://github.com/google/libultrahdr#tag=$pkgver)
sha256sums=('dc0676f202224f19bb1ee78691291e90a687d29b34348a490aba31d3623160a1')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
