# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocsparse
pkgver=7.2.3
pkgrel=1
pkgdesc='BLAS for sparse computation on top of ROCm'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/index.html'
license=('MIT')
depends=('rocm-core' 'glibc' 'libgcc' 'hip-runtime-amd' 'rocprim' 'rocblas')
makedepends=('cmake' 'rocm-cmake' 'rocm-toolchain' 'gcc-fortran')
source=("rocm-libraries-$pkgver.tar.gz::https://github.com/ROCm/rocm-libraries/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('300cc50720d40bad7c7ed1f6d67e8c5ebecaba62c07a6ea1cc5813c0ea2e41b5')
_dirname="rocm-libraries-rocm-$pkgver/projects/$pkgname"
# Disable default build flags and use release mode as otherwise the linker step
# fails. The symbol offset size reaches the 32 bit integer limits.
options=(!lto !buildflags !strip)

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_CXX_COMPILER=amdclang++
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D GPU_TARGETS="$(rocm-supported-gfx -e gfx950)"
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
