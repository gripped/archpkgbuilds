# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-authen-sasl
pkgver=2.1900
pkgrel=3
pkgdesc="Perl/CPAN Module Authen::SASL : SASL authentication framework"
arch=(any)
url="https://search.cpan.org/dist/Authen-SASL"
license=("GPL" "PerlArtistic")
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('be3533a6891b2e677150b479c1a0d4bf11c8bbeebed3e7b8eba34053e93923b0')
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
