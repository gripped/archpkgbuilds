# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked-man
pkgver=2.0.0
pkgrel=1
pkgdesc="Wrapper adding manpage output to 'marked', inspired by 'ronn'"
arch=('any')
url='https://github.com/kapouer/marked-man'
license=('MIT')
depends=('marked' 'nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('f0defa5c7494cf6fd006f7fc6a27d458d5a888ab961ceba1c7fedebc8791062872e1caf198efe7217a372a57e3074e06da35e7533b6638a643e5a65947bd02f1')

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
