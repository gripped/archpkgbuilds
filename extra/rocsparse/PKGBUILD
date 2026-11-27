# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocsparse
pkgver=10.1
pkgrel=1
pkgdesc='BLAS for sparse computation on top of ROCm'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocSPARSE/en/latest/index.html'
license=('MIT')
depends=('rocm-core' 'glibc' 'libgcc' 'libstdc++' 'hip-runtime-amd' 'rocprim' 'rocblas' 'roctracer')
makedepends=('cmake' 'ninja' 'rocm-cmake' 'rocm-toolchain' 'rocm-llvm' 'gcc-fortran')
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('96a950a0587af7658811bef32f7f3502049bfa8261f332356b7c1cbf0cc6be84')
options=(!lto)

build() {
  # -g also emits DWARF for every GPU target into .hip_fatbin, which strip
  # does not remove. Keep host debug info only.
  CXXFLAGS+=" -Xarch_device -g0"

  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -B build
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_CXX_COMPILER=/opt/rocm/lib/llvm/bin/amdclang++
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
