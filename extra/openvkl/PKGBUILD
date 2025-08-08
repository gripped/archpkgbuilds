# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=openvkl
pkgver=2.0.1
pkgrel=3
pkgdesc="Intel® Open Volume Kernel Library"
arch=(x86_64)
url="https://www.openvkl.org/"
license=(Apache-2.0)
depends=(embree gcc-libs glibc onetbb openvdb rkcommon)
makedepends=(boost cmake ispc)
source=(
  https://github.com/openvkl/openvkl/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
)
sha256sums=('0c7faa9582a93e93767afdb15a6c9c9ba154af7ee83a6b553705797be5f8af62')

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake -B build -S ${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -DOpenVDB_ROOT=/usr \
    -Wno-dev
  cmake --build build --verbose
}

check() {
  LD_LIBRARY_PATH="${PWD}"/build ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
