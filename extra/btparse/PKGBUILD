# Maintainer:

pkgname=btparse
_dist=Text-BibTeX
pkgver=0.91
pkgrel=1
pkgdesc='C library for parsing and processing BibTeX files'
arch=(x86_64)
url='https://metacpan.org/release/Text-BibTeX'
license=(GPL-2.0-or-later)
depends=(
  glibc
)
makedepends=(
  perl-module-build
  perl-config-autoconf
  perl-extutils-libbuilder
)
source=(
  https://search.cpan.org/CPAN/authors/id/A/AM/AMBS/${_dist}-${pkgver}.tar.gz
)
sha256sums=('3f0113cf8fe71dc7484636dc8e2a581637ecbcc82d0be29bbd46d0bf3f8cdb37')

build() {
  cd $_dist-$pkgver
  perl Build.PL
  ./Build
}

package() {
  cd $_dist-$pkgver 
  install -Dm755 blib/usrlib/libbtparse.so -t "$pkgdir"/usr/lib
  install -Dm644 blib/usrinclude/btparse.h -t "$pkgdir"/usr/include
}
