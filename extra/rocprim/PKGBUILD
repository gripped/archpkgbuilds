# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=rocprim
pkgver=6.3.3
pkgrel=1
pkgdesc='Header-only library providing HIP parallel primitives'
arch=('any')
url='https://rocm.docs.amd.com/projects/rocPRIM/en/latest/index.html'
_git='https://github.com/ROCm/rocPRIM'
license=('MIT')
depends=('rocm-core' 'hip-runtime-amd')
makedepends=('cmake' 'rocm-cmake')
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('15e4f8dfc71175c568f8afa87e3e0e3c7ad0680c8bca0d9db3a39936ec185813')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_CXX_COMPILER=/opt/rocm/bin/hipcc
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_BUILD_TYPE=None
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
