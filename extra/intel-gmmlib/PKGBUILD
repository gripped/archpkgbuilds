# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib
pkgver=22.4.1
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
sha256sums=('451fbe2eac26533a896ca0da0356354ecc38680f273fce7d121c6a22251ed21e')

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
