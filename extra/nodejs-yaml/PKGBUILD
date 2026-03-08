# Maintainer: Felix Yan <felixonmars@archlinux.org>

_npmname=yaml
pkgname=nodejs-$_npmname
pkgver=2.3.0
pkgrel=1
pkgdesc="JavaScript parser and stringifier for YAML"
arch=('any')
url="https://eemeli.org/yaml/"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('f3fd7083374a73b6dcf44ea6cb9c198e675abc72ef3bf40e98b1b5141ba06e512f638217acb8e556220e98bdb81ed854d38da55930d13bdd05cf5629eba52733')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$_npmname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
