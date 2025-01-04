# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=ada
pkgver=2.9.2
pkgrel=1
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
arch=('x86_64')
url="https://github.com/ada-url/ada"
license=('Apache-2.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c2531474230837fcc73d780b7d05802df0e50217d8e84ba72af042fbcf37f3eaef228383867010f8ba2787c01e72a0877fb6ff8139d8a46dd5cfb9c2aef05e3f')

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
