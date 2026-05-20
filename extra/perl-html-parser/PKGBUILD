# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org>

pkgname=perl-html-parser
pkgver=3.84
pkgrel=1
pkgdesc="Perl HTML parser class"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
url="https://search.cpan.org/dist/HTML-Parser/"
depends=('perl-html-tagset' 'perl-http-message' 'perl-uri')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/O/OA/OALDERS/HTML-Parser-$pkgver.tar.gz)
sha512sums=('714441055da73c240106f047d4cc44dbb6bc11a967b48b7646225ba3ee81ef4cb233c11252883f2df2253f26476db2dff5ca3e3208759647ab4e0e31720b6f5d')

build() {
  cd HTML-Parser-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd HTML-Parser-$pkgver
  make test
}

package() {
  cd HTML-Parser-$pkgver
  make install DESTDIR="${pkgdir}"
}
