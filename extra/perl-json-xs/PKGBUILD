# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=perl-json-xs
pkgver=4.06
pkgrel=1
pkgdesc="JSON::XS - JSON serialising/deserialising, done correctly and fast"
url="https://search.cpan.org/dist/JSON-XS/"
license=("GPL")
arch=('x86_64')
depends=('perl' 'perl-common-sense' 'perl-types-serialiser')
makedepends=('perl-canary-stability')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/JSON-XS-$pkgver.tar.gz)
sha256sums=('07f09b369f64575cb269a7d6572fb253fe747de8fab1dd9c1ba46e5ae19cd2a0')

build() {
  cd  "$srcdir"/JSON-XS-$pkgver
  PERL_CANARY_STABILITY_NOPROMPT=1 \
  perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd  "$srcdir"/JSON-XS-$pkgver
  make DESTDIR="$pkgdir" install

}
