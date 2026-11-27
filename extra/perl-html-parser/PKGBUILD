# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Firmicus <francois.archlinux.org>

pkgname=perl-html-parser
pkgver=3.87
pkgrel=1
pkgdesc="Perl HTML parser class"
arch=('x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
url="https://search.cpan.org/dist/HTML-Parser/"
depends=('perl-html-tagset' 'perl-http-message' 'perl-uri')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/O/OA/OALDERS/HTML-Parser-$pkgver.tar.gz)
sha512sums=('c204bfb762466f755670713ab3768a9942fe63a7d60f4827a1358b0b5a1c56940fe9b893795d34266e27dafda0ff344fd30937a03d5f7f2f8d946287c332d278')

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
