# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=node-gyp
pkgver=12.2.0
pkgrel=1
pkgdesc='Node.js native addon build tool'
arch=('any')
url='https://github.com/nodejs/node-gyp'
license=('MIT')
depends=('nodejs' 'nodejs-nopt' 'semver')
makedepends=('git' 'jq' 'npm')
checkdepends=('python')
optdepends=('gcc: to build C++ modules'
            'make: to build C++ modules'
            'python: to build C++ modules')
options=('!emptydirs')
source=("git+$url.git#tag=v$pkgver")
b2sums=('71771e05e954473ea9c5e6556760ea823ced68f1d3dd3b05e5e70eb7294b4ac7ebea158c6ab7cb8b750cac1b9978f3342841bdd0392b383657468bf7aabf3780')

prepare() {
  cd $pkgname
  npm install
}

check() {
  cd $pkgname
  npm test
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/{usr/{bin,share/licenses/$pkgname},$mod_dir}
  ln -s $mod_dir/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname
  ln -s $mod_dir/LICENSE "$pkgdir"/usr/share/licenses/$pkgname

  cd $pkgname
  npm prune --omit=dev

  mapfile -t mod_files < <(npm pack --dry-run --json | jq -r .[].files.[].path)
  cp --parents -a "${mod_files[@]}" node_modules "$pkgdir"/$mod_dir

  # Experimental dedup
  rm -r "$pkgdir"/$mod_dir/node_modules/{,.bin/}{nopt,semver}
}
