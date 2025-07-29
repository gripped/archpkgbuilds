# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=ada
pkgver=3.2.7
pkgrel=1
pkgdesc='WHATWG-compliant and fast URL parser written in modern C++'
arch=('x86_64')
url="https://github.com/ada-url/ada"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7d72a848b94599ec930800a0ea970bf72bc7702727c23fb7fbbb66441246a8145bd7d7d876259fbe5975832555031fac36fb519b3f73dd3714d5514de193ead7')

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
