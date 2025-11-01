# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-gmmlib
pkgver=22.8.2
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
sha256sums=('2e43e538a002574f45d480a24e02297c960963dc7914b7328791d9836832ff43')

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
