# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=7.1.1
pkgrel=1
_pkgdesc="Heterogeneous Interface for Portability"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIP/en/latest/'
license=('MIT')
_amd_depends=('rocm-core' 'bash' 'perl' 'glibc' 'gcc-libs' 'numactl'
         'mesa' 'comgr' 'rocminfo' 'rocm-llvm' 'libelf' 'rocprofiler-register')
_nvidia_depends=('cuda')
makedepends=('git' 'cmake' 'python' 'python-cppheaderparser'
             "${_amd_depends[@]}" "${_nvidia_depends[@]}")
_tag="tag=rocm-$pkgver"
# HIPCC compiler wrapper
_hipcc='https://github.com/ROCm/llvm-project'
source=("rocm-$pkgver.tar.gz::https://github.com/ROCm/rocm-systems/archive/refs/tags/rocm-$pkgver.tar.gz"
        "$pkgbase-hipcc::git+$_hipcc#$_tag")
sha256sums=('3abbc89eb9c23d4ca51a4fc15db08acf0dfca48255f72bcb2cde94e99b4dc22a'
            'fed80645f307dff71c2bf54ae19133b87a2d90ad812ae86a9bc0203ffc7b09d5')
_projectBaseDir="rocm-systems-rocm-$pkgver/projects"

options=(!lto)

build() {
  local hipcc_common_args=(
    -Wno-dev
    -S "$srcdir/$pkgbase-hipcc/amd/hipcc"
    -D CMAKE_BUILD_TYPE=None
  )

  local hipcc_amd_args=(
    "${hipcc_common_args[@]}"
    -B build-amd-hipcc
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
  )
  cmake "${hipcc_amd_args[@]}"
  cmake --build build-amd-hipcc

  local hip_amd_args=(
    -Wno-dev
    -S "$srcdir/$_projectBaseDir/clr"
    -B build-amd
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/
    -DHIP_PLATFORM=amd
    -DHIP_COMMON_DIR="$srcdir/$_projectBaseDir/hip"
    -DHIPCC_BIN_DIR="$srcdir/build-amd-hipcc"
    -DHIPNV_DIR="$srcdir/$_projectBaseDir/hipother/hipnv"
    -DHIP_CATCH_TEST=0
    -DCLR_BUILD_HIP=ON
    -DCLR_BUILD_OCL=OFF
  )
  cmake "${hip_amd_args[@]}"
  cmake --build build-amd

  local hipcc_nvidia_args=(
    "${hipcc_common_args[@]}"
    -B build-nvidia-hipcc
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${hipcc_nvidia_args[@]}"
  cmake --build build-nvidia-hipcc

  local hip_nvidia_args=(
    -Wno-dev
    -S "$srcdir/$_projectBaseDir/clr"
    -B build-nvidia
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DHIP_PLATFORM=nvidia
    -DHIP_COMMON_DIR="$srcdir/$_projectBaseDir/hip"
    -DHIPCC_BIN_DIR="$srcdir/build-nvidia-hipcc"
    -DHIPNV_DIR="$srcdir/$_projectBaseDir/hipother/hipnv"
    -DHIP_CATCH_TEST=0
    -DCLR_BUILD_HIP=ON
    -DCLR_BUILD_OCL=OFF
  )
  cmake "${hip_nvidia_args[@]}"
  cmake --build build-nvidia
}

package_hip-runtime-amd() {
  pkgdesc="$_pkgdesc (AMD runtime)"
  depends=("${_amd_depends[@]}")
  optdepends=('inetutils: Print hostname in hipconfig'
              'cuda: Cross compile for nvidia')
  replaces=("hip")
  provides=("hip=${pkgver}")
  DESTDIR="$pkgdir" cmake --install build-amd
  install -Dm644 "$srcdir/$_projectBaseDir/hip/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hip-runtime-nvidia() {
  pkgdesc="$_pkgdesc (Nvidia runtime)"
  depends=("${_nvidia_depends[@]}")
  DESTDIR="$pkgdir" cmake --install build-nvidia
  install -Dm644 "$srcdir/$_projectBaseDir/hip/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
