# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=perl-specio
pkgver=0.50
pkgrel=1
pkgdesc="Type constraints and coercions for Perl"
arch=('any')
url="https://search.cpan.org/dist/Specio"
license=('GPL' 'PerlArtistic')
depends=('perl-role-tiny' 'perl-test-fatal' 'perl-mro-compat' 'perl-devel-stacktrace'
	 'perl-clone' 'perl-eval-closure')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Specio-$pkgver.tar.gz)
sha256sums=('467baf0582681626266318e3154727497d7205996fbd76674ba58ed79e10640e')

build() {
  cd  "$srcdir"/Specio-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make
}
package() {
  cd  "$srcdir"/Specio-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
