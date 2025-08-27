# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=roctracer
pkgver=6.4.3
pkgrel=1
pkgdesc='ROCm tracer library for performance tracing'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/roctracer/en/latest'
license=('MIT')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hip-runtime-amd' 'hsa-rocr' 'comgr')
makedepends=('cmake' 'python-cppheaderparser' 'python-ply')
_git='https://github.com/ROCm/roctracer'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('a4378652b3b7141ca3b2743eedada03757383bff88932db8e28d0afd5869b882')
options=('!lto')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

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

  install -Dm644 "$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
