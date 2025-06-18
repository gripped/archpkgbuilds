# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cgi
pkgver=4.69
pkgrel=1
pkgdesc='Handle Common Gateway Interface requests and responses'
arch=('any')
url='https://metacpan.org/dist/CGI'
license=('Artistic-2.0')
depends=('perl>=5.8.1' 'perl-html-parser')
checkdepends=('perl-test-nowarnings' 'perl-test-warn>=0.3')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/L/LE/LEEJO/CGI-$pkgver.tar.gz")
sha512sums=('d8dbb476fdfb43bac1d7674c25e046eabaf15dcf582c453e1810367cb2ed435b7fcc597ecaab32692832997e16d04152928cc145502781f8c6698bfdefcc4407')
b2sums=('71e244baee17cd6adf8f6794f8a51a7da943f76d88316e5e239771bb369ebc4e44a976fbe2e86f83fc6dff620d22bfd940d792484bd5b1fca2409a6828716b70')

build() {
  cd "CGI-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "CGI-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "CGI-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
