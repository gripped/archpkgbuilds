# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=node-gyp
pkgver=9.4.1
pkgrel=1
pkgdesc='Node.js native addon build tool'
arch=('any')
url='https://github.com/nodejs/node-gyp'
license=('MIT')
depends=('nodejs' 'nodejs-nopt' 'python' 'semver')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('39091629b8d029b1a431fff1a88d638f2de809380c28969ce7c1b6f9b8d96f77f36ba816d98ac249d31061aa136fbd1caef13ffc69e0af87f40205479aa1ef05')

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  # Experimental dedup
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}nopt
  rm -r "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules/{,.bin/}semver

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
