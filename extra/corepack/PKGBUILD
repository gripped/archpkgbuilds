# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=corepack
pkgver=0.34.5
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
b2sums=('b23f0b1cd1c7c0b8f32d18ed25498465f660f1b34f8ee0d66c03b55c51f8fdae53b475271febb870f76c8221a30635eb43020ea2e1e3cbb9a3f9e12b506ac4db')

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
