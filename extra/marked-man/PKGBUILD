# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=marked-man
pkgver=2.1.0
pkgrel=1
pkgdesc="Wrapper adding manpage output to 'marked', inspired by 'ronn'"
arch=('any')
url='https://github.com/kapouer/marked-man'
license=('MIT')
depends=('marked' 'nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('b475bd711cf7c52d39ccfa251ebeaa3f969682ecdc7c126f3118e0dd10e738dc6ce6137189f16ff53c88a17e3b6133ab728dc054aec421b874ad6810d18a2790')

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
