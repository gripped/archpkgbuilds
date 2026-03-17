# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=5.0.5
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://github.com/chjj/marked'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('6ae4e62894c1c1933f18b5453a19a463ba4bf2fff40f1883697442da41326a370d2745d79fd36984b0f4d74e9d6d6adb3f07320f86340eeb35e8e902cd43247e')

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
