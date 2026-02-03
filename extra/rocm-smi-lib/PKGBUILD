# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-smi-lib
pkgver=7.2.0
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocm_smi_lib/en/latest'
license=('NCSA')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hsa-rocr' 'python')
makedepends=('cmake')
_git='https://github.com/ROCm/rocm-systems'
source=("rocm-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('728ea7e9bf16e6ed217a0fd1a8c9afaba2dae2e7908fa4e27201e67c803c5638')
options=(!lto)
_dirname="rocm-systems-rocm-$pkgver/projects/rocm-smi-lib"

build() {
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_BUILD_TYPE=None
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
