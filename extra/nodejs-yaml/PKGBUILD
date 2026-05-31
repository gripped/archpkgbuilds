# Maintainer: Felix Yan <felixonmars@archlinux.org>

_npmname=yaml
pkgname=nodejs-$_npmname
pkgver=2.8.3
pkgrel=1
pkgdesc="JavaScript parser and stringifier for YAML"
arch=('any')
url="https://eemeli.org/yaml/"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha512sums=('02f6da08b38ed8eb70fe55b96e687d77f58475c0c5750a766766541f7a57f54da2872518d27bcbbfb27a4eb5a8c2495118f61b07f22e20c7d88316823e0e41a6')

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
