# Maintainer: Florian Pritz <bluewind@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-mail-dkim
pkgver=1.20240619
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
md5sums=('0f37fb811c65a792c784c49cc1dba54f')
sha512sums=('7f401b69e43e0023d745dab90e6e179c1103ad08e151642a3eb031edb92a7d092388f11d537c8ece1dd1b2cc0e31bb40222c82c1ac0f62d86be211e9a467f2dc')
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
