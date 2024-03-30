# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib
pkgver=22.3.18
pkgrel=1
pkgdesc="Intel Graphics Memory Management Library"
arch=(x86_64)
url="https://github.com/intel/gmmlib/"
license=(MIT)
depends=(gcc-libs)
makedepends=(cmake)
provides=(gmmlib)
conflicts=(gmmlib)
replaces=(gmmlib)
options=(!emptydirs)
source=(https://github.com/${pkgname/-//}/archive/${pkgname}-${pkgver}.tar.gz)
sha256sums=('381f7ad104e3d0d8dd6c3ec0c8304e410a479c439e72db35c83fb7e2b0ec556f')

build() {
  cmake -B build -S gmmlib-${pkgname}-${pkgver} \
    -G 'Unix Makefiles' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRUN_TEST_SUITE=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 gmmlib-${pkgname}-${pkgver}/LICENSE.md -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
