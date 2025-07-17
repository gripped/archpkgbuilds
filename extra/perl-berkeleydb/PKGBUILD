# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>
# Contributor: Francois Charette <firmicus@gmx.net>

pkgname=perl-berkeleydb
pkgver=0.66
pkgrel=2
pkgdesc="Interface to Berkeley DB"
arch=('x86_64')
url="https://search.cpan.org/dist/BerkeleyDB/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'db5.3')
options=('!emptydirs')
source=(https://search.cpan.org/CPAN/authors/id/P/PM/PMQS/BerkeleyDB-$pkgver.tar.gz)
sha256sums=('c64138df293afcd961fc6d5d4253992d94dcbbfbd54bf889565cc8be4fe6b291')

build() {
  cd  "$srcdir"/BerkeleyDB-$pkgver
  export BERKELEYDB_INCLUDE="/usr/include/db5.3/"
  export BERKELEYDB_NAME="-ldb-5.3"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/BerkeleyDB-$pkgver
  make pure_install doc_install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
