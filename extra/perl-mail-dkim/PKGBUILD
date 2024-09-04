# Maintainer: Florian Pritz <bluewind@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-mail-dkim
pkgver=1.20240827
pkgrel=1
pkgdesc='Signs/verifies Internet mail with DKIM/DomainKey signatures'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl-crypt-openssl-rsa perl-cryptx perl-mail-authenticationresults
         perl-mailtools perl-net-dns)
checkdepends=('perl>=5.6' perl-net-dns perl-net-dns-resolver-mock
              perl-test-requiresinternet perl-yaml-libyaml)
url=https://metacpan.org/release/Mail-DKIM
source=("https://cpan.metacpan.org/authors/id/M/MB/MBRADSHAW/Mail-DKIM-$pkgver.tar.gz")
md5sums=('997f73cdc720944307accc1957aa334f')
sha512sums=('845caedc8cc10807a40069fcfe82ca873eacfb08c4e80df1d89b00e20c37c8cdb056115a65947621dec95001d439b72756ecf4f5aa695f213ba97fca55dae0cd')
_ddir="Mail-DKIM-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
