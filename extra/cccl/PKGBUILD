# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=cccl
pkgver=3.3.3
pkgrel=3
pkgdesc="CUDA Core Compute Libraries"
arch=(any)
url="https://github.com/NVIDIA/cccl"
license=(Apache-2.0)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
        $pkgname-8842.patch::https://patch-diff.githubusercontent.com/raw/NVIDIA/cccl/pull/8842.patch)
b2sums=('449d66188620b53ee9b05f14bdeca3f0d03b8fcee4c149d2f20c5d98fa06b835f8799b1e40bfda4b565ac72c6a0d28495c625a861884f7c57dad9379c64a0080'
        'bd484a8700ec80343576a0238475ee19a71ac9b1dc3e41c072b315f437ebeb406d6b040bb02de56be1dcd5fb73041af45e29cfb7b88a970ee5309e26fa902294')

prepare() {
  cd $pkgname-$pkgver
  # remove leading :: after struct in proclaims_copyable_arguments specializations
  # https://github.com/NVIDIA/cccl/pull/8842
  patch -p1 < ../$pkgname-8842.patch
}

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_INCLUDEDIR=include/$pkgname
    -DCCCL_ENABLE_EXAMPLES=OFF
    -DCCCL_ENABLE_TESTING=OFF
    -DTHRUST_ENABLE_EXAMPLES=OFF
    -DTHRUST_ENABLE_HEADER_TESTING=OFF
    -DTHRUST_ENABLE_TESTING=OFF
    -DCUB_ENABLE_EXAMPLES=OFF
    -DCUB_ENABLE_HEADER_TESTING=OFF
    -DCUB_ENABLE_TESTING=OFF
    -DLIBCUDACXX_ENABLE_LIBCUDACXX_TESTS=OFF
    # controls only enable_language(CUDA) in CMake, but we don't build anything
    -DLIBCUDACXX_ENABLE_CUDA=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
