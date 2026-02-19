# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=rkcommon
pkgver=1.14.2
pkgrel=1
pkgdesc="Intel RenderKit common C++/CMake infrastructure"
arch=(x86_64)
url="https://github.com/ospray/rkcommon/"
license=(Apache-2.0)
depends=(gcc-libs glibc onetbb)
makedepends=(cmake)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('79334ef3dadddb03ec0483fbf49bf690fb8902d5c2732d977b2c116651484cc6')

build() {
  cmake -B build -S ${pkgname}-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
