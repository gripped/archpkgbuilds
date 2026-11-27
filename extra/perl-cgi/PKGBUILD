# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cgi
pkgver=5.02
pkgrel=3
pkgdesc='Handle Common Gateway Interface requests and responses'
arch=('any')
url='https://metacpan.org/dist/CGI'
license=('Artistic-2.0')
depends=('perl>=5.8.1' 'perl-html-parser>=3.69' 'perl-uri>=1.76')
checkdepends=('perl-test-nowarnings' 'perl-test-warn>=0.3')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/L/LE/LEEJO/CGI-$pkgver.tar.gz")
sha512sums=('7eaa9eb63b7ce1a2095189240a62a18c43855d217adcd00985a16f0ae05ed726c1949083e3544e084daf38694c342952900c38f16a4f45c1e9cc6630182850d7')
b2sums=('de263a0dac35dbab33ef4e1d55eb8adfee72d425c9f07f059a0e6b0b35fadddde4517cd4be224303e90e581342d7aa4b051f264973f94c012eef7e57b8f0a79d')

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
