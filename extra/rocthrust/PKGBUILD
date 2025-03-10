# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocthrust
pkgver=6.3.2
pkgrel=1
pkgdesc='Port of the Thrust parallel algorithm library atop HIP/ROCm'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocThrust/en/latest/index.html'
license=('Apache-2.0')
depends=('rocm-core' 'hip-runtime-amd' 'rocprim')
makedepends=('cmake' 'rocm-cmake')
_git='https://github.com/ROCm/rocThrust'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('c3991bbd9f8b0e3ecbc18a7d014446608bfe2a3660a8d9e3dcc136d784883935')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
