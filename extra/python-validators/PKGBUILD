# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.32.0
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
sha512sums=('f0bc263b7472ad83ff229a005ba37f9f843dd81653c80bba2cba4b7f9767e61f0737dc0902a6bb7c67f78db71137767bce25e65e5fc6e1993669571c1b1f9c88')

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
