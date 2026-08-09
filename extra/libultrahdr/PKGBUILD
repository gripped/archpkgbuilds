# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr
pkgver=2.0.0
pkgrel=1
pkgdesc='The reference codec for the Ultra HDR format'
arch=(x86_64)
url='https://github.com/google/libultrahdr'
license=(Apache-2.0)
depends=(glibc
         libgcc
         libjpeg-turbo
         libstdc++)
makedepends=(cmake
             git)
source=(git+https://github.com/google/libultrahdr#tag=v$pkgver)
sha256sums=('88da9628a492d4289ff37d5ed28d651f8acc05b842c7c9f92569a31f4e6613a5')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DUHDR_BUILD_TESTS=ON \
    -Wno-dev
  cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
