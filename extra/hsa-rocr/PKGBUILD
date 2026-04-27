# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: Bruno Filipe <bmilreu@gmail.com>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: Alexandru M Stan <alex@hypertriangle.com>

pkgname=hsa-rocr
pkgver=7.2.2
pkgrel=1
pkgdesc='HSA Runtime API and runtime for ROCm'
arch=('x86_64')
url='https://github.com/ROCm/rocm-systems'
license=('NCSA')
depends=(
    'glibc'
    'libdrm'
    'libelf'
    'libgcc'
    'numactl'
    'pciutils'
    'rocm-core'
    'rocm-device-libs'
    'rocprofiler-register'
)
provides=("hsakmt-roct=$pkgver")
replaces=('hsakmt-roct')
makedepends=('cmake' 'rocm-llvm' 'xxd')
source=("rocm-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('72bc9d97c537b77dc19bf51fe377db11eb029a6adf4fbd95190bc8ead0b83063')
_dirname="$(basename "$url")-rocm-$pkgver"/projects/rocr-runtime/
options=(!lto)

build() {
  # Silence warnings on optional libraries with -DNDEBUG,
  # https://github.com/RadeonOpenCompute/ROCR-Runtime/issues/89#issuecomment-613788944
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D CMAKE_PREFIX_PATH=/opt/rocm
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"
    -DBUILD_SHARED_LIBS=ON)
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
