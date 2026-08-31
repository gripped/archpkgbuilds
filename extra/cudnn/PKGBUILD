# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>

pkgname=cudnn
pkgver=9.25.1.1
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
b2sums_x86_64=('66fb5d57db36bb0e205f912557b10e9067eae50a1b637928d113037d2ee544d6699a20f01eb5d62abfeef1edbf2241838d15d6d6b22e14d1ed0a8c6cf211f7d1')
b2sums_aarch64=('c73f8866cd454131dd3643bdb7d05929c1ae08cc98b53297f373c1e67799e1a64a52283de632815dbfd05d66fada5f304cecf440a4677ea7362f14bb181bb59c')

package() {
  cd cudnn-linux-*-${pkgver}_cuda${_cudaver}-archive

  mkdir "$pkgdir"/usr
  cp -rv lib include "$pkgdir"/usr

  # remove static libs
  rm "$pkgdir"/usr/lib/*.a

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim: ts=2 sw=2 et
