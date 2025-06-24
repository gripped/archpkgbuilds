# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=perl-specio
pkgver=0.51
pkgrel=2
pkgdesc="Type constraints and coercions for Perl"
arch=('any')
url="https://search.cpan.org/dist/Specio"
license=('GPL' 'PerlArtistic')
depends=('perl-role-tiny' 'perl-test-fatal' 'perl-mro-compat' 'perl-devel-stacktrace'
	 'perl-clone' 'perl-eval-closure' 'perl-clone-choose')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Specio-$pkgver.tar.gz)
sha256sums=('505f5de28bee55545b9ec0c45c1d5e4ae568d4f5dbb5e8eabe9d980cb9b68f93')

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
