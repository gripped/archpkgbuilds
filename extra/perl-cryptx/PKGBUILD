# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-cryptx
pkgver=0.089
pkgrel=1
pkgdesc='Cryptographic toolkit'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/CryptX
source=("https://cpan.metacpan.org/authors/id/M/MI/MIK/CryptX-$pkgver.tar.gz")
md5sums=('db4060fa186a82b0659deefac256d885')
sha512sums=('315d32b29d7f98906f394c09255db588d6bb0c91dcffc35a7e416b7cf4ce7b2bd93d19a9ee875f2d486a2dcaddaf3009580d1b7bda6aea665f046920acb8b394')
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
