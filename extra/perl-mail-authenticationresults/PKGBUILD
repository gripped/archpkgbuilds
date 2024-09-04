# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-mail-authenticationresults
pkgver=2.20231031
pkgrel=2
pkgdesc='Object Oriented Authentication-Results Headers'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.8' perl-clone perl-json)
checkdepends=(perl-test-exception)
url=https://metacpan.org/release/Mail-AuthenticationResults
source=("https://cpan.metacpan.org/authors/id/M/MB/MBRADSHAW/Mail-AuthenticationResults-$pkgver.tar.gz")
md5sums=('ebabfd9e0946ca04e9693e3190ee2f2e')
sha512sums=('fc1a1f9099e1d3c3a2185bb2ba9f53be6799779b71dc1e7524e117b78e3868e9d264668bde188e787868a303d62262e9ded2fa9e1657d1987e9cbe488d06ed8e')
_ddir="Mail-AuthenticationResults-$pkgver"

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
