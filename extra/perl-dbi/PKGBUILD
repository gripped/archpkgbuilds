# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.646
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="http://search.cpan.org/dist/DBI/"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-pod' 'perl-test-pod-coverage')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-$pkgver.tar.gz")
sha512sums=('19a30690eb9b0b1aa619ce938c09993445048f6b433792bec85d655c9138e0530c4129e8312c0d63911948a9f2ff4411277c252a8ae7b42fbfef4d894abfe45d')

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
