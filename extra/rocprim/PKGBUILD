# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>

pkgname=rocprim
pkgver=7.2.0
pkgrel=1
pkgdesc='Header-only library providing HIP parallel primitives'
arch=('any')
url='https://rocm.docs.amd.com/projects/rocPRIM/en/latest/index.html'
_git='https://github.com/ROCm/rocm-libraries'
license=('MIT')
depends=('rocm-core' 'hip-runtime-amd')
makedepends=('cmake' 'git' 'rocm-cmake' 'rocm-toolchain')
_git='https://github.com/ROCm/rocm-libraries'
source=("rocm-libraries::git+$_git.git#tag=rocm-$pkgver")
sha256sums=('e1b1239b5c9025437edd1a3af757fd37cd8fa299bdbbbce6f82392fd2c7df736')
_dirname="rocm-libraries/projects/$pkgname"

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

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
