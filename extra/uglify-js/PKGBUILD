# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Nagy <danielnagy at gmx de>

pkgname=uglify-js
pkgver=3.19.2
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
sha512sums=('4bc280e830c8e3b9d05c94a2d9cb50eb6f58cf0395b3e6d030be8302dbf2d3080d7698bed324a940ad20da9c41ab6c5f176cf7602b1cbbb34d03c9d74fd3e521')

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
