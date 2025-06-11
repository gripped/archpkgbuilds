# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.23.2
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://github.com/kvesteri/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('0c6416ab3fb036808d826175ee724b26c4f3d1e9d7e4fe9b5dd3e5111340a5c026f7378da2e604abe17fdd072632405e23dcba59c57620f5ce4695ec61519ab8')

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
