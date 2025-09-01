# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocprim
pkgver=6.4.3
pkgrel=2
pkgdesc='Header-only library providing HIP parallel primitives'
arch=('any')
url='https://rocm.docs.amd.com/projects/rocPRIM/en/latest/index.html'
_git='https://github.com/ROCm/rocPRIM'
license=('MIT')
depends=('rocm-core' 'hip-runtime-amd')
makedepends=('cmake' 'rocm-cmake' 'rocm-toolchain')
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('b66feed30fe53aa8f2f8902604394c72f156b6517f8e5174d5b9d0b3dfcbb3c1')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  export CC=amdclang
  export CXX=amdclang++
  CXXFLAGS+=" -fcf-protection=none"
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_TOOLCHAIN_FILE="$srcdir/$_dirname"/toolchain-linux.cmake
    -D AMDGPU_TARGETS=$(rocm-supported-gfx)
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
