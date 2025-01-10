# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_name=TypeScript
pkgname=typescript
pkgver=5.7.3
pkgrel=1
pkgdesc='JavaScript with syntax for types'
arch=(any)
url=http://www.typescriptlang.org
license=(Apache-2.0)
depends=(nodejs)
makedepends=(
  git
  npm
  rsync
)
source=("git+https://github.com/microsoft/$_name.git#tag=v$pkgver")
b2sums=('c1e2efee1aedf71a12d46c1f1e6dd47f3e1ce2c56a5c2ff1c68a03cf9abf0b8f955e4c9e1448cc1b8bb8e44d75c1272b1099efb251c9b167ca6b3b2592b66332')

prepare() {
  cd $_name
  npm ci
}

build() {
  cd $_name
  npx hereby LKG
}

check() {
  cd $_name
  npm run test
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/{usr/bin,$mod_dir}
  ln -s $mod_dir/bin/{tsc,tsserver} "$pkgdir"/usr/bin

  cd $_name
  rsync -r --exclude=.gitattributes bin lib package.json "$pkgdir"/$mod_dir
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md SECURITY.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname \
    ThirdPartyNoticeText.txt
}
