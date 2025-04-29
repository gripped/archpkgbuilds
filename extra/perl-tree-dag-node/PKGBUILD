# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=perl-tree-dag-node
pkgver=1.34
pkgrel=1
pkgdesc="base class for trees"
arch=('any')
url="https://search.cpan.org/dist/Tree-DAG_Node"
license=('GPL' 'PerlArtistic')
depends=('perl-file-slurper')
options=('!emptydirs')
source=(https://www.cpan.org/authors/id/R/RS/RSAVAGE/Tree-DAG_Node-$pkgver.tgz)
sha512sums=('b32c7806db3b2dff6625109e1eed24a5324aef67d042a05f1c35429be85ce6e98932e674bb704eed21e83c48417d2f3050c0fc5208ba54b8de884c7dbe8d9cfe')

build() {
  cd  "$srcdir"/Tree-DAG_Node-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd  "$srcdir"/Tree-DAG_Node-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
