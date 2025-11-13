# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=node-gyp
pkgver=12.1.0
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
b2sums=('9b85e613547008d1f3d6f003ac87a96be8e80bc44c5afdc4e42879dbb513a62e2a9c512f1c5065b2935f520e17c9f58205adf50c0160c737ae047556e181777c')

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
