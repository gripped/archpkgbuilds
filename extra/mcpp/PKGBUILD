# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mcpp
pkgver=2.7.2.1
pkgrel=1
pkgdesc="Matsui's CPP implementation precisely conformed to standards"
arch=(x86_64)
url="http://mcpp.sourceforge.net"
license=(BSD-2-Clause)
depends=(glibc)
source=(
  "https://github.com/museoa/mcpp/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "double-namlen.patch"
)
sha256sums=('ec6c2ead79b2334fccf56b8811256c4fccbbe2350e6a2e52dc83a1c7ad995af4'
            'ee8bf97c42150d2424a5984baec8227a44538e15c23cec93aabfc65daf9a6081')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../double-namlen.patch
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
