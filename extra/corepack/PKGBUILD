# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=corepack
pkgver=0.34.3
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
b2sums=('b2edeeab4dc3a52be26151c7c25ca083ec9617fc4cb3997d525b52bfdf3104e079e034a47857598bd4e364e40db1b677139f9846f45aab5df36f630cf7f0267a')

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
