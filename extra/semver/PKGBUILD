# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=semver
pkgver=7.7.4
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
b2sums=('3b83a1dc34a0523090b34bcf069754a7a6c8eb645790ce6db6b823246cbb7aac2140dc8a7ce109efa8979d1e6c016f8652f54413ad7787ebf7480ff64dc37e96')

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
