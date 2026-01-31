# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-authen-sasl
pkgver=2.2000
pkgrel=1
pkgdesc="Perl/CPAN Module Authen::SASL : SASL authentication framework"
arch=(any)
url="https://search.cpan.org/dist/Authen-SASL"
license=("GPL" "PerlArtistic")
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('8cdf5a7f185448b614471675dae5b26f8c6e330b62264c3ff5d91172d6889b99')
options=(!emptydirs)

build() {
  cd "$srcdir"/Authen-SASL-$pkgver
  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Authen-SASL-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"
}
