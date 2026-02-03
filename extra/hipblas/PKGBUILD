# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naether.markus@gmail.com>

pkgname=hipblas
pkgver=7.2.0
pkgrel=1
pkgdesc='ROCm BLAS marshalling library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/hipBLAS/en/latest/index.html'
license=('MIT')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hip-runtime-amd' 'hipblas-common' 'rocblas' 'rocsolver')
makedepends=('rocm-cmake' 'git' 'cmake' 'gcc-fortran')
_git='https://github.com/ROCm/rocm-libraries'
source=("rocm-libraries::git+$_git.git#tag=rocm-$pkgver")
sha256sums=('e1b1239b5c9025437edd1a3af757fd37cd8fa299bdbbbce6f82392fd2c7df736')
_dirname="rocm-libraries/projects/$pkgname"

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
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
