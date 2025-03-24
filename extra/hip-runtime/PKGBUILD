# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=6.3.3
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
# Common HIP dir (AMD or nVidia)
_hip='https://github.com/ROCm/HIP'
# HIPCC compiler wrapper
_hipcc='https://github.com/ROCm/llvm-project'
# ROCclr, HIPAMD and OpenCl repositories
_clr='https://github.com/ROCm/clr'
# Cross compilation
_hipother='https://github.com/ROcm/hipother'
source=("$pkgbase::git+$_hip#$_tag"
        "$pkgbase-hipcc::git+$_hipcc#$_tag"
        "$pkgbase-clr::git+$_clr#$_tag"
        "$pkgbase-hipother::git+$_hipother#$_tag")
sha256sums=('dcf2775d69ba69f95dd994d377a9f234ed59154a22114251bc8a9afadf66fe6b'
            'c64fd724503b9c10381f350eea38fadb622ea86067839d45cd0efc0058621153'
            'cb0dc592635c647a6edee70377f70b573927e8491fd3341c67bce77d9b0b23a9'
            '69c85a155706a50239355c4d3adecfed61e5a75f774c6fe8cc2188d33e39fcd2')

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
    -S "$srcdir/$pkgbase-clr"
    -B build-amd
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/
    -DHIP_PLATFORM=amd
    -DHIP_COMMON_DIR="$srcdir/$pkgbase"
    -DHIPCC_BIN_DIR="$srcdir/build-amd-hipcc"
    -DHIPNV_DIR="$srcdir/$pkgbase-hipother/hipnv"
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
    -S "$srcdir/$pkgbase-clr"
    -B build-nvidia
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DHIP_PLATFORM=nvidia
    -DHIP_COMMON_DIR="$srcdir/$pkgbase"
    -DHIPCC_BIN_DIR="$srcdir/build-nvidia-hipcc"
    -DHIPNV_DIR="$srcdir/$pkgbase-hipother/hipnv"
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
  install -Dm644 "$srcdir/$pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hip-runtime-nvidia() {
  pkgdesc="$_pkgdesc (Nvidia runtime)"
  depends=("${_nvidia_depends[@]}")
  DESTDIR="$pkgdir" cmake --install build-nvidia
  install -Dm644 "$srcdir/$pkgbase/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
