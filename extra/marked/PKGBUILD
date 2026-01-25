# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=5.0.3
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://github.com/chjj/marked'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('29438d6b8dd493be2e50d58cc61ea57da35899202c44c88301a5fc4010824555f312e7d1d335fa4f7defac66ef4e740b2f4dae9e00ccdca4b366d3be72125a1e')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/marked/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
