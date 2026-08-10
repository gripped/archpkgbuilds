# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr
pkgver=2.0.0
pkgrel=2
pkgdesc='The reference codec for the Ultra HDR format'
arch=(x86_64)
url='https://github.com/google/libultrahdr'
license=(Apache-2.0)
depends=(glibc
         libgcc
         libjpeg-turbo
         libstdc++)
# TODO: libheif support requires unmerged https://github.com/strukturag/libheif/pull/1503
makedepends=(cmake
             git
             gtest)
source=(git+https://github.com/google/libultrahdr#tag=v$pkgver
        unbundle-gtest.patch)
sha256sums=('fc6d647ba86459438e8b3e5ff4f8e0230652fe058014f4b0cc25e6a9911e0a69'
            'af6713ff9550016929f6a284a0e8b04fb8afffb14a15126095e1ca3f9c2ce57a')

prepare() {
  patch -d libultrahdr -p1 < unbundle-gtest.patch
}

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
