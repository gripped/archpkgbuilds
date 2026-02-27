# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=ada
pkgver=3.4.3
pkgrel=1
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
arch=('x86_64')
url="https://github.com/ada-url/ada"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d6642ee7a455079135a15031367ea455731f2e3d12edb7d3e922be62553bee32ceaa9f76aa7fa1a178fa076ee3d6ec49aeb0c094554b42dbb446d7e6bee79506')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
