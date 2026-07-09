# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=11.2.0
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://marked.js.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('1d1d26ddbbeed2300f62222f2d4510b5d83583a0f6e3bfff96f71e9291ced5632f6f00e5c12919017f4bc381786071354f41da68dbded2db805ae575509eafb7')

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
