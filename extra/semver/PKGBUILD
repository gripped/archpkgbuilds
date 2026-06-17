# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=semver
pkgver=7.8.3
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
b2sums=('b6010c674c0910a64c2a9ca19f83027bbc65083b65dcf0558ef7dcf9987ac32161807a54d319c19402b949d840483749f12730f0213634fb72a86ff278bb1e8b')

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
