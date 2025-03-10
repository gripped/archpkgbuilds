# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Markus Näther <naetherm@cs.uni-freiburg.de>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocminfo
pkgver=6.3.2
pkgrel=1
pkgdesc='ROCm Application for Reporting System Info '
arch=('x86_64')
url='https://github.com/ROCm/rocminfo'
license=('NCSA')
depends=('rocm-core' 'glibc' 'gcc-libs' 'pciutils' 'python' 'hsa-rocr')
makedepends=('cmake' 'rocm-cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('a98a32bae0e118397b5559b4a584c9363191bb2d1f45fe13b09f502016745e8f')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  # ROCRTST_BLD_TYPE=Release fixes a build error regarding _FORTIFY_SOURCE=2
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_PREFIX_PATH=/opt/rocm
    -D ROCRTST_BLD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_INSTALL_LIBDIR=lib
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
