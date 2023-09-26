# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gumbo-parser
pkgver=0.12.0
pkgrel=1
pkgdesc="HTML5 parsing library in pure C99"
arch=(x86_64)
url="https://codeberg.org/grisha/gumbo-parser/"
license=(Apache)
depends=(glibc)
checkdepends=(gtest)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/grisha/gumbo-parser/archive/$pkgver.tar.gz")
sha256sums=('f4820b8028b07406ba24ac74ef77057f5d9871f1b17c5486ad78e3da6e541e51')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make -k check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
