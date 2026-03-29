# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.31.0
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
sha512sums=('e6f1622341685190c0820163f6b012e4fa9ceecf916e6f60f06951fd5c91b928e535cb74509a9d982bb0b702cb25611882cbd77493a9440961e4a46bb681f497')

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
