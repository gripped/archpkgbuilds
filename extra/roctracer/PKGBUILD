# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=roctracer
pkgver=7.2.0
pkgrel=3
pkgdesc='ROCm tracer library for performance tracing'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/roctracer/en/latest'
license=('MIT')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hip-runtime-amd' 'hsa-rocr' 'comgr')
makedepends=('cmake' 'python-cppheaderparser' 'python-ply')
source=("rocm-$pkgver.tar.gz::https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('728ea7e9bf16e6ed217a0fd1a8c9afaba2dae2e7908fa4e27201e67c803c5638')
options=('!lto')
_dirname="rocm-systems-rocm-$pkgver/projects/$pkgname"

build() {
  local cmake_args=(
    -Wno-dev
    -B build
    -S "$_dirname"
    # https://gitlab.archlinux.org/archlinux/packaging/packages/roctracer/-/issues/6
    -D CMAKE_BUILD_TYPE=Release
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
