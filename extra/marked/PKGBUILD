# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked
pkgver=9.1.0
pkgrel=1
pkgdesc="A markdown parser built for speed"
arch=('any')
url='https://marked.js.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('5598e6d0f3390ccbfb5a876a394a6cde0e90edd9b1b3d606885519edada66a3cd04d30a05fee92e8d0091cfbce860141cd8cfcb3841929658c7d92859ac7ce80')

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
