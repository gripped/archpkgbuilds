# Maintainer: Felix Yan <felixonmars@archlinux.org>

_npmname=yaml
pkgname=nodejs-$_npmname
pkgver=2.4.2
pkgrel=1
pkgdesc="JavaScript parser and stringifier for YAML"
arch=('any')
url="https://eemeli.org/yaml/"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('07756a0d9f89020d67669684996b535d49419dea06c7a08f33d6f44c434ae9aa12bb9b7bddd22db9dc1d8268bab4794865921de1d67db2470043651b73201e54')

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
