# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=node-gyp
pkgver=13.0.1
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
b2sums=('a52ca5b79c443a98131fc5d1ea8b6b479a2bccaf0ee3135137aadbd0ef23c2771156adeff0ab72c6375f5c348af9d544795b8389b27a16c1d67fd634afcf690b')

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
