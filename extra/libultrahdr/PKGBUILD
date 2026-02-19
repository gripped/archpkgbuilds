# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libultrahdr
pkgver=1.4.0
pkgrel=2
pkgdesc='The reference codec for the Ultra HDR format'
arch=(x86_64)
url='https://github.com/google/libultrahdr'
license=(Apache-2.0)
depends=(glibc
         libgcc
         libglvnd
         libjpeg-turbo
         libstdc++)
makedepends=(cmake
             git)
source=(git+https://github.com/google/libultrahdr#tag=v$pkgver
        010-libultrahdr-gcc15-fix.patch::https://github.com/google/libultrahdr/commit/5fa99b5271a3c80a13c78062d7adc6310222dd8e.patch)
sha256sums=('67a20b13bef0a0100054956f2db880d1233843a5382a773bc2da2db0ffd93796'
            '6335c62964591e46a990100998104434fc8d395834b9923782ef91f64a6891cd')

prepare() {
  patch -d libultrahdr -Np1 -i "${srcdir}/010-libultrahdr-gcc15-fix.patch"
}

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
