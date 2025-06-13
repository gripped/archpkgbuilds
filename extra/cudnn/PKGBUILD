# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.10.2.21
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
b2sums=('17d56a2e459df88a7ae6c27c1edc093c3b58e6732e49d001d277e159ff90face0b722db9edd089bf36383dd4f48e225582583e2fbf52fae134787349bfda19c6'
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
