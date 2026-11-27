# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contriubtor: Markus Näther <naetherm@informatik.uni-freiburg.de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rccl
pkgver=10.1
pkgrel=1
pkgdesc="ROCm Communication Collectives Library"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rccl/en/latest/index.html'
license=('BSD-3-Clause')
depends=('rocm-core' 'glibc' 'libgcc' 'hip-runtime-amd' 'amdsmi' 'roctracer')
makedepends=('cmake' 'ninja' 'rocm-cmake' 'rocm-llvm' 'rocm-llvm-static' 'hipify-clang' 'python' 'fmt')
_git='https://github.com/ROCm/rocm-systems'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('314d0a54e68217efb12eafd2aacd439d4928f443795c778711d846355d262355')
options=(!lto)

build() {
  # Compile source code for supported GPU archs in parallel
  export HIPCC_COMPILE_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export HIPCC_LINK_FLAGS_APPEND="-parallel-jobs=$(nproc)"
  export CXX=/opt/rocm/lib/llvm/bin/amdclang++
  export CC=/opt/rocm/lib/llvm/bin/amdclang
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  CXXFLAGS+=" -fcf-protection=none"
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
    -G Ninja
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_TOOLCHAIN_FILE="$srcdir/$pkgname"/toolchain-linux.cmake
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
