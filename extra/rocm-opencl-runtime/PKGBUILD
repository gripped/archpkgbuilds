# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-opencl-runtime
pkgver=6.4.4
pkgrel=1
pkgdesc='OpenCL implementation for AMD'
arch=('x86_64')
url='https://github.com/ROCm/clr'
license=('MIT')
depends=('rocm-core' 'hsa-rocr' 'comgr' 'mesa'
         'glibc' 'gcc-libs' 'numactl'
         'opencl-icd-loader' 'opencl-headers')
makedepends=('rocm-cmake')
provides=('opencl-driver')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('7e5a7f82a55993acdf5bead15c29047659a6816e4580f530aeb916563e386ec3')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  local cmake_args=(
    -Wno-dev
    -S "$srcdir/$_dirname"
    -B build
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/
    -DCLR_BUILD_OCL=ON
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    echo '/opt/rocm/lib/libamdocl64.so' > 'amdocl64.icd'
    install -Dm644 'amdocl64.icd' "$pkgdir/etc/OpenCL/vendors/amdocl64.icd"
}
