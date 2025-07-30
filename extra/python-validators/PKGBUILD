# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-validators
pkgver=0.28.1
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://python-validators.github.io/validators"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/kvesteri/validators.git#tag=$pkgver")
sha512sums=('45d9903f25adea4874fe4c31bd2948dbd37e0b5e956c8ee300a19fce27c6b351e9d8e4ba0461b341d243f78c8aca3b3e121ccd1c4155816ccadb9e6bfd1219c9')

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
