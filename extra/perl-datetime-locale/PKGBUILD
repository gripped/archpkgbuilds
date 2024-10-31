# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-datetime-locale
pkgver=1.44
pkgrel=1
pkgdesc="Localization support for DateTime.pm "
arch=(any)
url="https://search.cpan.org/dist/DateTime-Locale"
license=('GPL' 'PerlArtistic')
depends=('perl-params-validate' 'perl-list-moreutils'
	 'perl-file-sharedir' 'perl-file-sharedir-install')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/D/DR/DROLSKY/DateTime-Locale-$pkgver.tar.gz)
sha256sums=('12a584a4a43c46114cd41ab6981be3609588604a906463fe4f844bb88a31c2de')

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
