# Maintainer:

pkgname=perl-data-dump
pkgver=1.28
pkgrel=1
pkgdesc="Pretty printing of data structures"
arch=(any)
url="https://metacpan.org/release/Data-Dump"
license=(PerlArtistic GPL)
depends=('perl')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/G/GA/GARU/Data-Dump-${pkgver}.tar.gz")
sha256sums=('2ce73373892b9b70170678530dac192ec3dfe9148bb06fec7becba536fc040df')

build() {
  cd Data-Dump-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Data-Dump-${pkgver}
  make test
}

package() {
  cd Data-Dump-${pkgver}
  make DESTDIR="$pkgdir" install
}
