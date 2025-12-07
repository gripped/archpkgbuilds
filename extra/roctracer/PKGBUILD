# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=roctracer
pkgver=7.1.1
pkgrel=1
pkgdesc='ROCm tracer library for performance tracing'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/roctracer/en/latest'
license=('MIT')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hip-runtime-amd' 'hsa-rocr' 'comgr')
makedepends=('cmake' 'python-cppheaderparser' 'python-ply')
source=("rocm-$pkgver.tar.gz::https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('3abbc89eb9c23d4ca51a4fc15db08acf0dfca48255f72bcb2cde94e99b4dc22a')
options=('!lto')
_dirname="rocm-systems-rocm-$pkgver/projects/$pkgname"

build() {
  local cmake_args=(
    -Wno-dev
    -B build
    -S "$_dirname"
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D HIP_ROOT_DIR=/opt/rocm
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
