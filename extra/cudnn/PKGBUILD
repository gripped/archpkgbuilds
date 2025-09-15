# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.11.0.98
_cudaver=12
pkgrel=3
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=(x86_64)
url="https://developer.nvidia.com/cuDNN"
license=(LicenseRef-NVIDIA-cuDNN)
depends=(
  "cuda>=${_cudaver}"
  glibc
  gcc-libs
  zlib libz.so
)
options=(!strip staticlibs)
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
# or https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/
# or https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/
source=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")
b2sums=('3c0c9ac68fe9436b5ebbb3483e848d7d33fb2c6d8bfc426b32ddad3c9efab5129d6f1aabc78c31c73c01f3408970e864a12d4c9fa6cca562759f580d80c5571e')

package() {
  cd cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive

  mkdir "$pkgdir"/usr
  cp -rv lib include "$pkgdir"/usr

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim: ts=2 sw=2 et
