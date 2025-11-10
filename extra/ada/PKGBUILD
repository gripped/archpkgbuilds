# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=ada
pkgver=3.3.0
pkgrel=1
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
arch=('x86_64')
url="https://github.com/ada-url/ada"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('bf42536fb11c6f23834abaa53c304817a99f0e851083b9055e6d7a5f2cc20e3975488e94ecb7207de546c639d93d01eab3b693ab7d007c404b2888730f5578e5')

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
