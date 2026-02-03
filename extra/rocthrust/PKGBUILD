# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocthrust
pkgver=7.2.0
pkgrel=1
pkgdesc='Port of the Thrust parallel algorithm library atop HIP/ROCm'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocThrust/en/latest/index.html'
license=('Apache-2.0')
depends=('rocm-core' 'hip-runtime-amd' 'rocprim')
makedepends=('cmake' 'rocm-cmake' 'rocm-toolchain')
_git='https://github.com/ROCm/rocm-libraries/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm/rocm-libraries/releases/download/rocm-$pkgver/$pkgname.tar.gz")
sha256sums=('fafd4f3a08f71cb59e7299af641141aad5d4a2568630544647514883a6707827')

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
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
