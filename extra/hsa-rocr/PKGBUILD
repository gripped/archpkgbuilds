# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: Bruno Filipe <bmilreu@gmail.com>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: Alexandru M Stan <alex@hypertriangle.com>

pkgname=hsa-rocr
pkgver=10.1
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
makedepends=('cmake' 'rocm-llvm' 'rocm-llvm-static' 'xxd')
source=("rocm-${pkgver}.tar.gz::$url/archive/therock-$pkgver.tar.gz"
        # https://github.com/ROCm/rocm-systems/pull/13277
        "$pkgname-stripped-symtab.patch::$url/commit/e9f923eadedbe0a9b7e969940114cd00aade7ebd.patch")
sha256sums=('31dc4296cb15c3eada729743731d236ee4a52e4a2a301b9da9075b94c012be19'
            'b64cfd84a80cf08b4cf13f827b26068a758bfbbff0d3703add2b446675a30c70')
_dirname="$(basename "$url")-therock-$pkgver"/projects/rocr-runtime/
options=(!lto)

prepare() {
  patch -d "$(basename "$url")-therock-$pkgver" -Np1 --no-backup-if-mismatch \
    -i "$srcdir/$pkgname-stripped-symtab.patch"
}

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
    -D Clang_DIR=/opt/rocm/lib/llvm/lib/cmake/clang
    -D LLVM_DIR=/opt/rocm/lib/llvm/lib/cmake/llvm
    -D CMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"
    -DBUILD_SHARED_LIBS=ON)
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
