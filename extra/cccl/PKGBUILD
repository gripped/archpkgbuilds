# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=cccl
pkgver=3.4.0
pkgrel=1
pkgdesc="CUDA Core Compute Libraries"
arch=(any)
url="https://github.com/NVIDIA/cccl"
license=(Apache-2.0)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('9ff222b22ab876f6b8ca3f58420decafb6eae9617eae56bb447176bd17a7b61cbce542e4166384cae29cbdec88371f0bb6dd307dcb6a1bdd627079548adffdfd')

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
