# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cryptx
pkgver=0.081
pkgrel=1
pkgdesc='Cryptographic toolkit'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/CryptX
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-$pkgver.tar.gz")
md5sums=('e75b68643ccac3fa09c11ece603bfbef')
sha512sums=('7d527bb664e853051cab4d6e0a77a26af8ab705f9d88ecce79352920b497c0c7ff62df371522276a1ad97e8d8f9a7405e2bc77d71df6f5629aab389f67a348fe')
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
