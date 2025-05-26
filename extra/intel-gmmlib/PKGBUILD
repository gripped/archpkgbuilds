# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib
pkgver=22.7.2
pkgrel=1
pkgdesc="Intel Graphics Memory Management Library"
arch=(x86_64)
url="https://github.com/intel/gmmlib/"
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(cmake)
provides=(gmmlib)
conflicts=(gmmlib)
replaces=(gmmlib)
options=(!emptydirs)
source=(https://github.com/${pkgname/-//}/archive/${pkgname}-${pkgver}.tar.gz)
sha256sums=('36f2ff2b59158d1253a33d735f4e35a1b5740c4751818bdaa222b8ddf96ee881')

build() {
  cmake -B build -S gmmlib-${pkgname}-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5.0 \
    -DRUN_TEST_SUITE=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 gmmlib-${pkgname}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
