# Maintainer: Felix Yan <felixonmars@archlinux.org>

_npmname=yaml
pkgname=nodejs-$_npmname
pkgver=2.3.1
pkgrel=1
pkgdesc="JavaScript parser and stringifier for YAML"
arch=('any')
url="https://eemeli.org/yaml/"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('d9e1d67e36a85e04c10b68cd3352d179feb65506b4ba6b6f4620d293a1d2cd6ed1bd2e58b6469b26bc182cb10a58173c6b95363d3482b3e7498d44c97651ec59')

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
