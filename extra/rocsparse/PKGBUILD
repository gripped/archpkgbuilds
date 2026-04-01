# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocsparse
pkgver=7.2.1
pkgrel=2
pkgdesc='BLAS for sparse computation on top of ROCm'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/index.html'
license=('MIT')
depends=('rocm-core' 'glibc' 'libgcc' 'hip-runtime-amd' 'rocprim' 'rocblas')
makedepends=('cmake' 'rocm-cmake' 'rocm-toolchain' 'gcc-fortran')
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROCm/rocm-libraries/releases/download/rocm-$pkgver/$pkgname.tar.gz")
sha256sums=('ef168ca552cae6d4394d0a9a9b8a6e0dd866623d768bba897c31e1d4b5207d13')
# Disable default build flags and use release mode as otherwise the linker step
# fails. The symbol offset size reaches the 32 bit integer limits.
options=(!lto !buildflags !strip)

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
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
  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
