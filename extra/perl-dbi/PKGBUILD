# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=perl-dbi
pkgver=1.652
pkgrel=1
pkgdesc="Database independent interface for Perl"
arch=('x86_64')
url="https://metacpan.org/release/DBI"
license=('GPL-1.0-or-later' 'Artistic-1.0-Perl')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/DBI-$pkgver.tgz")
sha512sums=('b695a177c7e3a1c0da70b4f2864521264fdda9560fd12f416add42d6f23099344bab5b13e9477c2283265a603013fad90a025610fdab1498b0792ae741c89a00')

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
