# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=semver
pkgver=7.7.3
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
b2sums=('c7b71714f5d28f15d91858fcb5e339e1a6068efec1e9293088e13d2e857012fcc6c943c321862c705a0c974c04d36d6c5fbf7d48fe918bb4afaf17eccaa3542d')

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
