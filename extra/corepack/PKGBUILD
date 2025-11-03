# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=corepack
pkgver=0.34.2
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
b2sums=('36fa27b4a5203257bd96971035a44208aab1554e27f3b5046b512f57273cf219d51b2993b543e979710b02f011e518deec32ed1706a58645676811d97ad6624c')

prepare() {
  cd $pkgname
  mkdir bin
  corepack enable --install-directory bin yarn
  yes | bin/yarn set version stable
  bin/yarn install --immutable
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
