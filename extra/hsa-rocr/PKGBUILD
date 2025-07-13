# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: Bruno Filipe <bmilreu@gmail.com>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>
# Contributor: Alexandru M Stan <alex@hypertriangle.com>

pkgname=hsa-rocr
pkgver=6.4.1
pkgrel=2
pkgdesc='HSA Runtime API and runtime for ROCm'
arch=('x86_64')
url='https://github.com/ROCm/ROCR-Runtime'
license=('NCSA')
depends=('rocm-core' 'glibc' 'gcc-libs' 'numactl' 'pciutils' 'libelf' 'libdrm'
         'rocm-device-libs' 'rocprofiler-register')
provides=("hsakmt-roct=$pkgver")
replaces=('hsakmt-roct')
makedepends=('cmake' 'rocm-llvm' 'xxd')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
        hsa-rocr-6.4-fix-missing-include.patch)
sha256sums=('f72d100a46a2dd9f4c870cef156604777f1bdb1841df039d14bf37b19814b9da'
            '6b7c62245fd9021ade8046e6a769e48c8c1868131dbac19531befc5f2a4c25b5')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"
options=(!lto)

prepare() {
    patch -d "${_dirname}" -Np1 < "${srcdir}/hsa-rocr-6.4-fix-missing-include.patch"
}

build() {
  # Silence warnings on optional libraries with -DNDEBUG,
  # https://github.com/RadeonOpenCompute/ROCR-Runtime/issues/89#issuecomment-613788944
  local cmake_args=(
    -Wno-dev
    -S "$_dirname/"
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
