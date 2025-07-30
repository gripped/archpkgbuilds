# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=node-gyp
pkgver=11.3.0
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
b2sums=('205104e30b1516f157eea2acb264b201375c2ada705c4ac3721b7bf5caff3ef31da85cd20d1e7116dceff316f06fa47085145186008254cb78414eb4a72b8281')

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
