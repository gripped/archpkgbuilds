# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Markus Näther <naetherm@cs.uni-freiburg.de>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocminfo
pkgver=7.2.2
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
source=("rocm-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('72bc9d97c537b77dc19bf51fe377db11eb029a6adf4fbd95190bc8ead0b83063')
_dirname="rocm-systems-rocm-$pkgver/projects/$pkgname"

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
