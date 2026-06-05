# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=node-gyp
pkgver=12.4.0
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
b2sums=('bebd8496a2d078c315d9aae3c5158f4f7c8d00f5f6da03da57a2a2bab18a52c33ba8885e28b423a7118b6c6306a190c45d6a88bc8ffb43ee7df0f43d68d72726')

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
