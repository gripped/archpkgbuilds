# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib
pkgver=22.8.1
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
sha256sums=('9b8eac1891650021ded26b72585e7a2c702a3ba47565c968feabd14ab38d18f7')

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
