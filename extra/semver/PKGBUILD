# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=semver
pkgver=7.8.0
pkgrel=1
pkgdesc='The semantic version parser used by npm'
arch=('any')
url='https://github.com/npm/node-semver'
license=('ISC')
depends=('nodejs')
makedepends=(
  'git'
  'jq'
  'npm'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('ff47d0ede4ff05a2ac3df56f1da08d56c0b46f2c6e6dff5cd43d5ecc30f9b4ba1cd57ca4265a53414f256398da6b04bde7607e1d3a4d2fc99294529a840aa855')

prepare() {
  cd node-$pkgname
  npm install
}

check() {
  cd node-$pkgname
  npm test --ignore-scripts
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/{usr/{bin,share/{doc,licenses}/$pkgname},$mod_dir}
  ln -s $mod_dir/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/README.md "$pkgdir"/usr/share/doc/$pkgname
  ln -s $mod_dir/LICENSE "$pkgdir"/usr/share/licenses/$pkgname

  cd node-$pkgname
  # lib/ is not currently packaged
  mapfile -t mod_files < <(jq -r '.files[]' package.json | sed '/lib\//d')
  cp -r "${mod_files[@]}" LICENSE README.md package.json "$pkgdir"/$mod_dir
}
