# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-mail-box
pkgver=4.01
pkgrel=1
pkgdesc="Mail folder manager and MUA backend"
arch=(any)
url="https://search.cpan.org/dist/Mail-Box"
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
depends=('perl-timedate' 'perl-digest-hmac' 'perl-file-remove>=0.20'
	 'perl-io-stringy' 'perl-mime-types>=1.004' 'perl-mailtools'
	 'perl-object-realize-later>=0.14' 'perl-uri>=1.23'
	 'perl-devel-globaldestruction' 'perl-user-identity>=0.90'
	 'perl-mail-message')
options=('!emptydirs')
source=(https://cpan.metacpan.org/authors/id/M/MA/MARKOV/Mail-Box-$pkgver.tar.gz)
sha256sums=('ad66807dd830371278c7fc31f3df9048c16ce9d01430d5fb4414feae05f1fe0d')

prepare() {
  cd  "$srcdir"/Mail-Box-$pkgver
  find . -name '*.pod' -empty -exec rm -f {} \;
}

build() {
  cd  "$srcdir"/Mail-Box-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd  "$srcdir"/Mail-Box-$pkgver
#  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
#    make test
#  )
}

package() {
  cd  "$srcdir"/Mail-Box-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
