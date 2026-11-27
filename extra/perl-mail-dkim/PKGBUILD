# Maintainer: Florian Pritz <bluewind@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-mail-dkim
pkgver=1.20261116
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
md5sums=('c10d65d3629c997f5c568476fc4ebd0c')
sha512sums=('2598fd1da814e02fca1e4ba74bc873dd8b3ca337937ecfc72a91d8adfa8dd1006a6bbfedce931eba8728be780d05550e586943a9354c8799609f4a4d32ac2565')
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
