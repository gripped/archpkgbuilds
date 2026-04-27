# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cryptx
pkgver=0.088
pkgrel=1
pkgdesc='Cryptographic toolkit'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/CryptX
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-$pkgver.tar.gz")
md5sums=('2ac128328b153d338997190c9c36e9d7')
sha512sums=('7a1e26ee662e98f35af0eb96da413b615a35e83d0f2f33a2bde85ea46a601e8128ca2f6be3394691a09b5d707bf4aacbfd7c1e57b59d760065a4ddca054220e5')
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
