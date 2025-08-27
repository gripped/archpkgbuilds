# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-smi-lib
pkgver=6.4.3
pkgrel=1
pkgdesc='ROCm System Management Interface Library'
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/rocm_smi_lib/en/latest'
license=('NCSA')
depends=('rocm-core' 'glibc' 'gcc-libs' 'hsa-rocr' 'python')
makedepends=('cmake')
_git='https://github.com/ROCm/rocm_smi_lib'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('74fde0f8cd9362f7073db22ffb98c72f1f7bdb42b6e7a63ae4e0a06607644d4a')
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
