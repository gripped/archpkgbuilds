# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=wcslib
pkgver=8.4
pkgrel=1
pkgdesc="A C library that implements the 'World Coordinate System' (WCS) standard in FITS"
arch=(x86_64)
url='https://www.atnf.csiro.au/people/Mark.Calabretta/WCS/'
license=(GPL3)
depends=(cfitsio
         glibc)
makedepends=(gcc-fortran)
source=(http://www.atnf.csiro.au/people/mcalabre/WCS/$pkgname-$pkgver.tar.bz2)
sha256sums=('960b844426d14a8b53cdeed78258aa9288cded99a7732c0667c64fa6a50126dc')

build() {
  cd $pkgname-$pkgver

  export CFLAGS+=" -ffat-lto-objects"
  ./configure --prefix=/usr --without-pgplot
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Fix wrong permissions
  chmod g=rx,-s "$pkgdir"/usr/{bin/,/lib/{,pkgconfig},share/man/man1/}
  chmod -s "$pkgdir"/usr/{include/wcslib-$pkgver/,share/doc/wcslib-$pkgver/{,html/}}
}
