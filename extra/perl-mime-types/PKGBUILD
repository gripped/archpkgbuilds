# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-mime-types
pkgver=2.28
pkgrel=2
pkgdesc="Perl/CPAN Module MIME::Types : Information and processing MIME types"
arch=('any')
url="https://search.cpan.org/dist/MIME-Types/"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-$pkgver.tar.gz")
sha512sums=('0b11eb5059fc7124bdd38ab0beda1a31d1729710bac079f8a95cc383c166d0773f76c0ce305bfb85c3849ecc7158f24ca6bcf31b755b2b9f82aa6dfea0aa060c')

build() {
  cd MIME-Types-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd MIME-Types-$pkgver
  make test
}

package() {
  cd MIME-Types-$pkgver
  make DESTDIR="${pkgdir}" install
}
