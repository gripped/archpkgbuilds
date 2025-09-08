# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mcpp
pkgver=2.7.2.2
pkgrel=2
pkgdesc="Matsui's CPP implementation precisely conformed to standards"
arch=(x86_64)
url="http://mcpp.sourceforge.net"
license=(BSD-2-Clause)
depends=(glibc)
source=(
  "https://github.com/museoa/mcpp/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "double-namlen.patch"
)
sha256sums=('d2d74eab7a13ade4b1070b11a5bd6775cc5509d88c1ca525f8c4ee3bae79c601'
            'ee8bf97c42150d2424a5984baec8227a44538e15c23cec93aabfc65daf9a6081')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../double-namlen.patch

  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  export CFLAGS=" \
    -Wno-implicit-function-declaration \
    -Wno-incompatible-pointer-types \
    -Wno-discarded-qualifiers \
  "
  ./configure --prefix=/usr --enable-mcpplib --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
