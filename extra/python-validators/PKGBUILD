# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.30.0
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
sha512sums=('a11e82ed8da754f105ef73add62701d3fca06f93631b76fba1aaf32774080bf4d7751a3e484b072450aa40fe7b07749a150b4bb13590978256bafb1d58d4dedb')

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
