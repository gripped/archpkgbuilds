# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgbase=hip-runtime
pkgname=(hip-runtime-amd hip-runtime-nvidia)
pkgver=6.2.2
pkgrel=2
_pkgdesc="Heterogeneous Interface for Portability"
arch=('x86_64')
url='https://rocm.docs.amd.com/projects/HIP/en/latest/'
license=('MIT')
_amd_depends=('rocm-core' 'bash' 'perl' 'glibc' 'gcc-libs' 'numactl'
         'mesa' 'comgr' 'rocminfo' 'rocm-llvm' 'libelf' 'rocprofiler-register')
_nvidia_depends=('cuda')
makedepends=('cmake' 'python' 'python-cppheaderparser'
             "${_amd_depends[@]}" "${_nvidia_depends[@]}")
# Common HIP dir (AMD or nVidia)
_hip='https://github.com/ROCm/HIP'
# HIPCC compiler wrapper
_hipcc='https://github.com/ROCm/llvm-project'
# ROCclr, HIPAMD and OpenCl repositories
_clr='https://github.com/ROCm/clr'
# Cross compilation
_hipother='https://github.com/ROcm/hipother'
source=("$pkgbase-$pkgver.tar.gz::$_hip/archive/rocm-$pkgver.tar.gz"
        "$pkgbase-hipcc-$pkgver.tar.gz::$_hipcc/archive/rocm-$pkgver.tar.gz"
        "$pkgbase-clr-$pkgver.tar.gz::$_clr/archive/rocm-$pkgver.tar.gz"
        "$pkgbase-hipother-$pkgver.tar.gz::$_hipother/archive/rocm-$pkgver.tar.gz"
        "hipcc-amd-fix-include.patch")
sha256sums=('72c064a5b22d007272075917ab504d4d38716975bdba370110f7a1d7e3658aa8'
            '43aad76be2099ecc40d8d323d35b8a81dea4b8d9bfe993a51aa6220f91216dfb'
            '3af1d829fc7b2fe9c16c930c1bcea4d82fee16e9e1b244f0fc370cd7ea0e34e5'
            'cb029266f5adb4de35d310d6c47be67578822119379b7fa888614e8c02876108'
            '9f384e6d43b9fa75d722d1b22cd310667c8569ce7e1c4deefcff3e58875f099a')
_dirhip="$(basename "$_hip")-$(basename "${source[0]}" ".tar.gz")"
_dirhipcc="$(basename "$_hipcc")-$(basename "${source[1]}" ".tar.gz")"
_dirclr="$(basename "$_clr")-$(basename "${source[2]}" ".tar.gz")"
_dirhipother="$(basename "$_hipother")-$(basename "${source[3]}" ".tar.gz")"

prepare() {
  cd "$_dirhipcc"
  patch -Np1 -i "$srcdir/hipcc-amd-fix-include.patch"
}

build() {
  local hipcc_common_args=(
    -Wno-dev
    -S "$srcdir/$_dirhipcc/amd/hipcc"
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
    -S "$srcdir/$_dirclr"
    -B build-amd
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/
    -DHIP_PLATFORM=amd
    -DHIP_COMMON_DIR="$srcdir/$_dirhip"
    -DHIPCC_BIN_DIR="$srcdir/build-amd-hipcc"
    -DHIPNV_DIR="$srcdir/$_dirhipother/hipnv"
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
    -S "$srcdir/$_dirclr"
    -B build-nvidia
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DHIP_PLATFORM=nvidia
    -DHIP_COMMON_DIR="$srcdir/$_dirhip"
    -DHIPCC_BIN_DIR="$srcdir/build-nvidia-hipcc"
    -DHIPNV_DIR="$srcdir/$_dirhipother/hipnv"
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
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hip-runtime-nvidia() {
  pkgdesc="$_pkgdesc (Nvidia runtime)"
  depends=("${_nvidia_depends[@]}")
  DESTDIR="$pkgdir" cmake --install build-nvidia
  install -Dm644 "$srcdir/$_dirhip/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
