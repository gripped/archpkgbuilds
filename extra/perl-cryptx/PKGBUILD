# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cryptx
pkgver=0.085
pkgrel=1
pkgdesc='Cryptographic toolkit'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/CryptX
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-$pkgver.tar.gz")
md5sums=('ced0fe6d967ee4051614d7feeaf64af9')
sha512sums=('620eb8d9a8a1e9fbd2d877491d34667fbafb7d29a4de0bc1b95e9eddef22b4b6fa749a1f8f86ff25088bc8d4d3efdeea0a462b0a32b03e63c343392884b79cd9')
_ddir="CryptX-$pkgver"

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
