# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=razor
pkgver=2.87
pkgrel=2
pkgdesc="A distributed, collaborative, spam detection and filtering network"
arch=('x86_64')
url="https://metacpan.org/dist/Razor2-Client-Agent"
license=('Artistic-2.0')
depends=('perl')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/T/TO/TODDR/Razor2-Client-Agent-${pkgver}.tar.gz")
sha256sums=('3ba2105529d28a9086020ed3edd646d09f51f46cc8c8c3f186c046daad9cd756')

build() {
  cd Razor2-Client-Agent-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Razor2-Client-Agent-${pkgver}
  make test
}

package() {
  cd Razor2-Client-Agent-${pkgver}
  make DESTDIR="${pkgdir}" install
}
