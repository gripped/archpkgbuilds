# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.644
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="http://search.cpan.org/dist/DBI/"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/H/HM/HMBRAND/DBI-$pkgver.tar.gz")
sha512sums=('f0ea12d6287d8995df017a8a453f6548a0a5363de44b4708a84dd2906105ae94fee24ca5fd361520f9450bcf0e081c262e9f03fe4e9e7e16bf0f420b133a046a')

build() {
  cd DBI-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  sed -E 's|(^OPTIMIZE.*)|\1 -Wno-incompatible-pointer-types|' -i Makefile
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
