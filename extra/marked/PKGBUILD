# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=5.1.0
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://github.com/chjj/marked'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('cf7fe705eeda4c8f090ecce560b93b74354da67823c34a35649b6b03d9087e490770817ec47ee63b6dda2129785b13fcdde954f8c1513a06a1a9da5dd3994c11')

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
