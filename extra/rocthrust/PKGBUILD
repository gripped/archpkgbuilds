# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocthrust
pkgver=7.2.3
pkgrel=1
pkgdesc='Port of the Thrust parallel algorithm library atop HIP/ROCm'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocThrust/en/latest/index.html'
license=('Apache-2.0')
depends=('rocm-core' 'hip-runtime-amd' 'rocprim')
makedepends=('cmake' 'rocm-cmake' 'rocm-toolchain')
_git='https://github.com/ROCm/rocm-libraries/'
source=("rocm-libraries-$pkgver.tar.gz::https://github.com/ROCm/rocm-libraries/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('300cc50720d40bad7c7ed1f6d67e8c5ebecaba62c07a6ea1cc5813c0ea2e41b5')
_dirname="rocm-libraries-rocm-$pkgver/projects/$pkgname"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_CXX_COMPILER=amdclang++
    -D GPU_TARGETS="$(rocm-supported-gfx)"
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
