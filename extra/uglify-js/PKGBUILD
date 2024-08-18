# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=uglify-js
pkgver=3.19.0
pkgrel=1
pkgdesc="JavaScript parser, mangler/compressor and beautifier toolkit"
arch=('any')
url='http://lisperator.net/uglifyjs'
license=('BSD')
depends=('nodejs')
makedepends=('npm')
install=${pkgname}.install
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('c0d287518da161891fea84857e1c30887a385821f31e6cdc5eca9761337d8dade202960815b6f653a89cb3d8417182c7718190a009709d9953adfde817e04bfd')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/uglify-js/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
