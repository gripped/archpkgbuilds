# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.29.0
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://python-validators.github.io/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest' 'python-eth-hash')
optdepends=('python-eth-hash: for eth_address validator')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('a48099116f23668bf6cd1666c0800d5175ce6c11614c380819039d1a0bbb3187359775bef321159ca5acbaf54739697ea10872fc346788f19dea6fe2b94fa695')

build() {
  cd validators
  python -m build -nw
}

check() {
  cd validators
  python -m pytest
}

package() {
  cd validators
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
