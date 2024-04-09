# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-datetime-locale
pkgver=1.41
pkgrel=1
pkgdesc="Localization support for DateTime.pm "
arch=(any)
url="https://search.cpan.org/dist/DateTime-Locale"
license=('GPL' 'PerlArtistic')
depends=('perl-params-validate' 'perl-list-moreutils'
	 'perl-file-sharedir' 'perl-file-sharedir-install')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/D/DR/DROLSKY/DateTime-Locale-$pkgver.tar.gz)
sha256sums=('d928902b13262c998ac06c0a7f9911cc869014a0db2e72d2138fa5ab3c10dac2')

build() {
  cd  "$srcdir"/DateTime-Locale-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/DateTime-Locale-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
