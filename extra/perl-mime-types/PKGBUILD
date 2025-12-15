# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jan de Groot
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=perl-mime-types
pkgver=2.29
pkgrel=2
pkgdesc="Perl/CPAN Module MIME::Types : Information and processing MIME types"
arch=('any')
url="https://search.cpan.org/dist/MIME-Types/"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-$pkgver.tar.gz")
sha512sums=('2eb24fbd65d9702a7c7fdbbc2de331402a75a91ab1158fd1b4f823bf85fcf90f47b1110c3848bb707cf230671d65dce5e492665b917ae40180a2f4aa1964d157')

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
