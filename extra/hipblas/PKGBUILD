# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naether.markus@gmail.com>

pkgname=hipblas
pkgver=10.1
pkgrel=1
pkgdesc='ROCm BLAS marshalling library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/hipBLAS/en/latest/index.html'
license=('MIT')
depends=(
    'glibc'
    'hip-runtime-amd'
    'hipblas-common'
    'libgcc'
    'rocblas'
    'rocm-core'
    'rocsolver'
)
makedepends=('rocm-cmake' 'git' 'cmake' 'gcc-fortran' 'python')
_git='https://github.com/ROCm/rocm-libraries'
source=("$pkgname-$pkgver.tar.gz::$_git/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('453fa4099c8d5419fc2e2f03fd17c4b69b7d67a39259fa1841719189024d9fe0')

build() {
  # -fcf-protection is not supported by HIP, see
  # https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html#support-status-of-other-clang-options
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
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

  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
