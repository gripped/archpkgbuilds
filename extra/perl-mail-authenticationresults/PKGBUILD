# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=perl-mail-authenticationresults
_pkgname=Mail-AuthenticationResults
pkgver=2.20261029
pkgrel=1
pkgdesc='Object Oriented Authentication-Results Headers'
arch=(any)
url='https://metacpan.org/release/Mail-AuthenticationResults'
license=(GPL-1.0-or-later Artistic-1.0-Perl)
depends=(perl perl-clone perl-json)
checkdepends=(perl-test-exception)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/M/MB/MBRADSHAW/Mail-AuthenticationResults-$pkgver.tar.gz")
sha512sums=('0005c819c9f225899a3fb3a3641124b13d7e94905e8efe1834a579dc1cdd2719d28843e866090b3d3af420a52b4128365bfcc512e4e7ce8950b93a4d1871c88b')
b2sums=('710fd70551367e0c18e90ab666c66e5ca8c0de1f3c7581493e2104af84169f29589f32aa62f7d5a7d232d0be7e854a5f662e6eddee49a239a6418ab5041a209e')

build() {
  cd "$_pkgname-$pkgver"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  perl Makefile.PL
  make
}

check() {
  cd "$_pkgname-$pkgver"

  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
}

package() {
  cd "$_pkgname-$pkgver"

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
# vim:set ts=2 sw=2 et:
