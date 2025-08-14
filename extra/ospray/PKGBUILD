# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=ospray
pkgver=3.2.0
pkgrel=4
pkgdesc="Ray Tracing Based Rendering Engine for High-Fidelity Visualization"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=(
  embree
  gcc-libs
  glibc
  ispc
  onetbb
  openmpi
  openimagedenoise
  openvkl
  rkcommon
  snappy
)
makedepends=(
  benchmark
  cmake
  git
  glu
  gtest
  level-zero-headers
  level-zero-loader
)
optdepends=('benchmark: benchmarks'
            'gtest: tests suite')
source=(https://github.com/ospray/OSPRay/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2c8108df2950bc5d1bc2a62f74629233dbe4f36e3f6a8ea032907d4a3fdc6750')

prepare() {
  sed -i "s/EXACT REQUIRED/REQUIRED/g" $pkgname-$pkgver/cmake/ospray_options.cmake
}

build() {
  local cmake_options=(
    -B build
    -DCMAKE_BUILD_TYPE=Release  # None is not supported :(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DOSPRAY_BUILD_ISA=ALL
    -DOSPRAY_ENABLE_APPS_EXAMPLES=OFF
    -DOSPRAY_ENABLE_APPS_TUTORIALS=OFF
    -DOSPRAY_ENABLE_MODULES=ON
    -DOSPRAY_MODULE_DENOISER=ON
    -DOSPRAY_MODULE_MPI=ON
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
