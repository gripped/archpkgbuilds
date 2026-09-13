# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-params-someutil
pkgver=1.11
pkgrel=1
pkgdesc='Simple, compact and correct parameter-checking functions'
arch=('x86_64')
url='https://metacpan.org/dist/Params-SomeUtil'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/Params-SomeUtil-$pkgver.tar.gz")
sha256sums=('ad171c7c579e332d067089fa5cb11e3b2c9a6bddf41050d57274577e7bcc976a')

build() {
  cd Params-SomeUtil-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Params-SomeUtil-$pkgver
  make test
}

package() {
  cd Params-SomeUtil-$pkgver
  make DESTDIR="$pkgdir" install
}
