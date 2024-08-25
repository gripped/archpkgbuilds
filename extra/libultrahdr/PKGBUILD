# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libultrahdr
pkgver=1.1.0
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
sha256sums=('569f3bf141b7552470367645a2bedd2472ee45ae8abf0cb73c5f2f1c09fb6bde')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
