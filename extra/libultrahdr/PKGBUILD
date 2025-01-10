# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr
pkgver=1.3.1
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
source=(git+https://github.com/google/libultrahdr#tag=v$pkgver)
sha256sums=('1620209c80773652e03cf6500ce228ca6c87afe89221e33d8a83acd4be66a4c1')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
