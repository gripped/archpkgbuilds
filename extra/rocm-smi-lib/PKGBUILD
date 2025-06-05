# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-smi-lib
pkgver=6.4.1
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocm_smi_lib/en/latest'
license=('NCSA')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hsa-rocr' 'python')
makedepends=('cmake')
_git='https://github.com/ROCm/rocm_smi_lib'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('c82c8c9de89537b903d82711c531b4b1c6d104098b5370d049527d1f250944b7')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

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
  install -Dm644 "$srcdir/$_dirname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
