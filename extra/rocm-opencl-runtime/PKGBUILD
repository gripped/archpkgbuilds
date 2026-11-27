# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=rocm-opencl-runtime
pkgver=10.1
pkgrel=1
pkgdesc='OpenCL implementation for AMD'
arch=('x86_64')
url='https://github.com/ROCm/clr'
license=('MIT')
depends=(
  'comgr'
  'libgcc'
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
source=("rocm-systems::git+$_git#tag=therock-$pkgver")
sha256sums=('04a12e04a2b143a19ae948c09bceacc66cc8df0359dbcc30760047480ebd7bc7')
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

    # Place OpenCL configuration into standard search path
    mkdir -p "$pkgdir"/etc/{OpenCL,ld.so.conf.d}
    mv -vt "$pkgdir"/etc/OpenCL "$pkgdir"/opt/rocm/etc/OpenCL/*
    mv -vt "$pkgdir"/etc/ld.so.conf.d "$pkgdir"/opt/rocm/etc/ld.so.conf.d/*
    rm -r "$pkgdir"/opt/rocm/etc
    # ld.so.conf file still contains old ROCm path
    # https://gitlab.archlinux.org/archlinux/packaging/packages/rocm-opencl-runtime/-/work_items/14
    echo "/opt/rocm/lib/opencl" >> "$pkgdir"/etc/ld.so.conf.d/10-rocm-opencl.conf

    install -Dm644 "$_dir_name/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
