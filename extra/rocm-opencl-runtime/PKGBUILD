# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-opencl-runtime
pkgver=7.1.0
pkgrel=1
pkgdesc='OpenCL implementation for AMD'
arch=('x86_64')
url='https://github.com/ROCm/clr'
license=('MIT')
depends=(
  'comgr'
  'gcc-libs'
  'glibc'
  'hsa-rocr'
  'mesa'
  'numactl'
  'opencl-headers'
  'opencl-icd-loader'
  'rocm-core'
)
makedepends=('git' 'rocm-cmake')
provides=('opencl-driver')
_git='https://github.com/ROCm/rocm-systems'
source=("rocm-systems::git+$_git#tag=rocm-$pkgver")
sha256sums=('72a492b9332d1eca7b48f631d6278dd6cb2318e06ead74a13d12a99fe4d199d7')
_dir_name='rocm-systems/projects/clr'

build() {
  local cmake_args=(
    -Wno-dev
    -S "$srcdir/$_dir_name"
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

    install -Dm644 "$_dir_name/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    echo '/opt/rocm/lib/libamdocl64.so' > 'amdocl64.icd'
    install -Dm644 'amdocl64.icd' "$pkgdir/etc/OpenCL/vendors/amdocl64.icd"
}
