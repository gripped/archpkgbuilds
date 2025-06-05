# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=6.4.1
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
sha256sums=('8ed42c4542756c91136d9308fcc84e4532183de691d9efc9e7ce1e4efc483fae'
            'edb637d082a0d0a41e50f5128cf5b23226313bbc4f28e888843cde137e2f3594'
            '634a23d42abaa8b8757360e300b354205bc0bb0612ecc81c715b866347554fe6'
            '09f332aa964079647a9407406305f6159937c72c0bc2b675f841ba0ab1b63c43')

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
