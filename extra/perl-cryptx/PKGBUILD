# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cryptx
pkgver=0.084
pkgrel=1
pkgdesc='Cryptographic toolkit'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/CryptX
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-$pkgver.tar.gz")
md5sums=('9fb6d6f477e7f33571a2782d0ef2b86b')
sha512sums=('c67c5b0aca1899155c37c3dbdb92249d1bc3e1781478a0aec3b3d4e01c70efd806bc325dc991462f9064ba0f18ec7c56c6d8383f068277ae1fc684cad88d4bd9')
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
