# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-http-date
pkgver=6.07
pkgrel=1
pkgdesc="Date conversion routines"
arch=('any')
url="https://search.cpan.org/dist/HTTP-Date"
license=('PerlArtistic' 'GPL')
depends=('perl-timedate')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/HTTP-Date-$pkgver.tar.gz)
sha256sums=('278c875a1abae8b3afaf7961c8dfe8ea21b37e04ce8fe3c387e7eb999c1d2128')

build() {
  cd HTTP-Date-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd HTTP-Date-$pkgver
  make test
}

package() {
  cd HTTP-Date-$pkgver
  make DESTDIR="$pkgdir" install
}
