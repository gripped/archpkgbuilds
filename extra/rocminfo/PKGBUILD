# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@cs.uni-freiburg.de>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocminfo
pkgver=10.1
pkgrel=1
pkgdesc='ROCm Application for Reporting System Info '
arch=('x86_64')
url='https://github.com/ROCm/rocm-systems'
license=('NCSA')
depends=(
    'glibc'
    'hsa-rocr'
    'libgcc'
    'pciutils'
    'python'
    'rocm-core'
)
makedepends=('cmake' 'rocm-cmake')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/therock-$pkgver/$pkgname.tar.gz")
sha256sums=('057f8fcb4fc82d520f266014d6bfb53fb6d5e9413d9e4d71466026696d2c32d1')

build() {
  # ROCRTST_BLD_TYPE=Release fixes a build error regarding _FORTIFY_SOURCE=2
  local cmake_args=(
    -Wno-dev
    -S "$pkgname"
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

  install -Dm644 "$pkgname/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
