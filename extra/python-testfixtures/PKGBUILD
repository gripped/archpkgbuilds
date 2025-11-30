# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=9.2.0
pkgrel=1
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-zope-component' 'python-sybil'
              'python-pytest-django' 'python-django' 'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#tag=$pkgver")
sha512sums=('cfee61446a8704d4542ebf88076d3c761388de5ccfebd32b2bcaa201e2815397a84a96fed9d8f48d02391b7b73787963e9c2f55cf48bf805f78a40bc593dd6f3')

build() {
  cd testfixtures
  python setup.py build
}

check() {
  cd testfixtures
  PYTHONPATH="$PWD" pytest --ignore=build
}

package() {
  cd testfixtures
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
