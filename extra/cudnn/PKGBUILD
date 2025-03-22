# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.8.0.87
_cudaver=12
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=(LicenseRef-NVIDIA-cuDNN)
depends=('cuda>='"${_cudaver}")
options=(!strip staticlibs)
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
# or https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/
# or https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/
source=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz"
        "NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf")
b2sums=('384c18bf398a3fc2780b75759d32b80e8ed014c6d44a5b159c9165b2d5043ded1739e9e3e8b8c2d841f7afb5743bfa98d82cae06a5ea1f5dc2a7e9af4a2244ce'
        '222e3d3640808a130dfc339fa8e48ea396f784af77d09d90fae1e5550de8272e643d9a765d832b3d950234a3f7a8706a12191d49717f732cff190e5fd920ed52')

package() {
  cd cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive

  mkdir "$pkgdir"/usr
  cp -r lib include "$pkgdir"/usr

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 \
      "${srcdir}"/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf \
      "${pkgdir}"/usr/share/licenses/"${pkgname}"/NVIDIA_SLA+cuDNN_Supp_Feb2017_release.pdf
}

# vim: ts=2 sw=2 et
