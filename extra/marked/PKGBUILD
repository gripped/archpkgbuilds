# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=9.1.5
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://marked.js.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('d78406dec86ff0a83fc5cd1887a4cd90c8fdd305c7f669a5762e7de3523639ebdf27f1500052c4c2dc14dbf15f81200e325587ac4ba45921907fc322558346d8')

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
