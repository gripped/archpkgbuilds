# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked-man
pkgver=1.3.4
pkgrel=1
pkgdesc="Wrapper adding manpage output to 'marked', inspired by 'ronn'"
arch=('any')
url='https://github.com/kapouer/marked-man'
license=('MIT')
depends=('marked' 'nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('20818611fc460b026942e42c961895174571e391a23888b09d4a7971feb162ed46a38cdc426718a0e87d704ab8e2a0255ebfec6cbaf2c651633e6bcb02d26eee')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # Experimental dedup
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}marked

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/marked-man/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
