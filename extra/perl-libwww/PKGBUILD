# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=perl-libwww
pkgver=6.80
pkgrel=1
pkgdesc='The World-Wide Web library for Perl'
arch=(any)
url='https://metacpan.org/release/libwww-perl'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=(
  perl
  perl-encode-locale
  perl-file-listing
  perl-html-parser
  perl-http-cookies
  perl-http-daemon
  perl-http-cookiejar
  perl-http-date
  perl-http-negotiate
  perl-lwp-mediatypes
  perl-net-http
  perl-try-tiny
  perl-uri
  perl-www-robotrules
)
optdepends=('perl-lwp-protocol-https: for https:// url schemes')
checkdepends=(
  perl-test-fatal
  perl-test-needs
  perl-test-requiresinternet
)
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/O/OA/OALDERS/libwww-perl-$pkgver.tar.gz)
sha512sums=('fdc8f8fada7e0dded5fed4ea94ac9e21b45a8199a5ff0e08c921cccf00ffd5bc9b02d259d5b5b7105eae529ee585b801abb846ac3c74cf74af0bfd7953487ba5')
b2sums=('9e615655e1bff94d5cc436f9293258ad9ea855b1670b588dc788f2ae6c6c9a0965402a83c60afc8323f37e1f917b21c9443392d955fb4feba8c89563e5455b25')

build() {
  cd "libwww-perl-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check()  {
  cd "libwww-perl-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "libwww-perl-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
