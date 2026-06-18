# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.648
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="https://metacpan.org/release/DBI"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-$pkgver.tgz")
sha512sums=('ac4d6cf3fafd0e0f3f73c71242ac431b2a6273b28d8ff69704805dae5a1690a6b2cd66df3b91085286ccc3fdbe97bb7c533d66e3fe7b4d705e5fca5a9601dab9')

build() {
  cd DBI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd DBI-$pkgver
  make test
}

package() {
  cd DBI-$pkgver
  make DESTDIR="$pkgdir" install
}
