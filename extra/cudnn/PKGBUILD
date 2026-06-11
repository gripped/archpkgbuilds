# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.23.1.3
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
b2sums_x86_64=('9051f2588c93f533751229f6006047e8b819cab30e7699b06535b61440a954764a7ff246e6157a6111b2a12a35ba87afa8e22a80c7bbe4d479c0457deec6762e')
b2sums_aarch64=('8244e35a042ea9c3fd66639515035bd90ec6b1553754cd2d9fd47e79afe40510b48ba4c78209c8536e912819b34e244d72b0d7e71d7db1a152d17810b13deeff')

package() {
  cd cudnn-linux-*-${pkgver}_cuda${_cudaver}-archive

  mkdir "$pkgdir"/usr
  cp -rv lib include "$pkgdir"/usr

  # remove static libs
  rm "$pkgdir"/usr/lib/*.a

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim: ts=2 sw=2 et
