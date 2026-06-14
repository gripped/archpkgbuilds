# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=semver
pkgver=7.8.2
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
b2sums=('86cc970a632574211e153e770404f3922f32ca7a7cef197261fe3fbb355a78d239463726a3d2f84a7b962c996bfc79b1df00a88ae60dd7d613da2e9a49944376')

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
