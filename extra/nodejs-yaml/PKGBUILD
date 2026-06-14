# Maintainer: Felix Yan <felixonmars@archlinux.org>

_npmname=yaml
pkgname=nodejs-$_npmname
pkgver=2.9.0
pkgrel=1
pkgdesc="JavaScript parser and stringifier for YAML"
arch=('any')
url="https://eemeli.org/yaml/"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('d80be1357de66fccdde99cbb20d4ed4a9975175e475ba5a7aa3d2cad696428b729625fe03083098b2b86ab629e236605c543e376507edcb735d2c78c2ed2f870')

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
