# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=corepack
pkgver=0.34.6
pkgrel=1
pkgdesc='Zero-runtime-dependency Node.js script'
arch=(any)
url=https://github.com/nodejs/corepack
license=(MIT)
depends=(nodejs)
makedepends=(
  corepack
  git
  python
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('f6a2e43aac86bc217a726fc99d818b8ede65122479f43e7eab5f0ff44ea8c6fc9056c1ceefeead4362a87470f26877a1ca893d71735743761bbcbbc814fb7314')

prepare() {
  cd $pkgname
  mkdir bin
  corepack enable --install-directory bin yarn
  yes | bin/yarn set version stable
  yes | bin/yarn install --immutable
}

build() {
  cd $pkgname
  bin/yarn build
}

check() {
  cd $pkgname
  # Attempts to create symlinks in /usr/bin
  bin/yarn test run --exclude tests/Enable.test.ts
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/{usr/bin,usr/share/licenses/$pkgname,$mod_dir}
  ln -s $mod_dir/dist/$pkgname.js "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md

  cd $pkgname
  cp -a {CHANGELOG,LICENSE,README}.md dist package.json "$pkgdir"/$mod_dir
}
