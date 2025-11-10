# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=iso-codes
pkgver=4.19.0
pkgrel=1
pkgdesc='Lists of the country, language, and currency names'
url='https://salsa.debian.org/iso-codes-team/iso-codes'
arch=(any)
license=(LGPL-2.1-only)
makedepends=(git
             python)
source=(git+https://salsa.debian.org/iso-codes-team/iso-codes#tag=v$pkgver)
sha256sums=('0e9e11574ed12838403cd41384057a2d31d829e621517c19cacfc4e951bc56bf')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
