# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=wcslib
pkgver=8.5
pkgrel=2
pkgdesc="A C library that implements the 'World Coordinate System' (WCS) standard in FITS"
arch=(x86_64)
url='https://www.atnf.csiro.au/people/Mark.Calabretta/WCS/'
license=(GPL3)
depends=(cfitsio
         glibc)
makedepends=(gcc-fortran)
source=(https://www.atnf.csiro.au/computing/software/wcs/wcslib-releases/$pkgname-$pkgver.tar.bz2)
sha256sums=('f1fd1b78fbfdbabda363f8045e0c59e32735eca45482a5302191e56fe062eace')

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
