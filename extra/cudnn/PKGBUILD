# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.25.0.15
_cudaver=13
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=(x86_64 aarch64)
url="https://developer.nvidia.com/cuDNN"
license=(LicenseRef-NVIDIA-cuDNN)
depends=(
  "cuda>=${_cudaver}"
  glibc
  libgcc
  libstdc++
  zlib libz.so
)
options=(!strip)
# To figure out these URLs, check out the Dockerfiles at
# https://gitlab.com/nvidia/container-images/cuda/-/tree/master/dist for the appropriate cuda version
# or make an NVIDIA Developer account.
# Alternatively, check https://github.com/pytorch/builder/blob/master/common/install_cuda.sh
# or https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/
# or https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/
source_x86_64=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-x86_64/cudnn-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")
source_aarch64=("https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/linux-sbsa/cudnn-linux-sbsa-${pkgver}_cuda${_cudaver}-archive.tar.xz")
b2sums_x86_64=('2dc7ca9b6b2a6064ce68e84304cf24b777398aa00ebf33221fe137042626d96a2d008c8d6e695e2eaba17d91d666fe1f555e473fe7168011e43567ec78b77d52')
b2sums_aarch64=('f5d54c5f2eea681c68862b4df63edc6563063334eee410c96cf4fbae5510ad7ff839a2dd65b81f3725f9d2805b92f8238890b42b587c21c432ece77f74ddba9f')

package() {
  cd cudnn-linux-*-${pkgver}_cuda${_cudaver}-archive

  mkdir "$pkgdir"/usr
  cp -rv lib include "$pkgdir"/usr

  # remove static libs
  rm "$pkgdir"/usr/lib/*.a

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim: ts=2 sw=2 et
