# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=perl-authen-sasl
pkgver=2.1800
pkgrel=2
pkgdesc="Perl/CPAN Module Authen::SASL : SASL authentication framework"
arch=(any)
url="https://search.cpan.org/dist/Authen-SASL"
license=("GPL" "PerlArtistic")
source=("https://cpan.metacpan.org/authors/id/E/EH/EHUELS/Authen-SASL-$pkgver.tar.gz")
sha256sums=('0b03686bddbbf7d5c6548e468d079a4051c9b73851df740ae28cfd2db234e922')

build() {
  cd "$srcdir"/Authen-SASL-$pkgver
  PERL_USE_UNSAFE_INC=1 \
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Authen-SASL-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
