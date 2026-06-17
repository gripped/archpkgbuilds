# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=12.1.0
pkgrel=1
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-sybil' 'python-pytest-django' 'python-click'
              'python-django' 'python-loguru' 'python-numpy' 'python-pandas'
              'python-polars' 'python-structlog' 'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#tag=$pkgver")
sha512sums=('dfd8eb61427850d24cee6874a3dad0cf077575fc3f11ac0a6977a721da5878f47d7ce5719cb931a2bc1b108663b11e614b8b87494ff3a1419a77648a01bb8e41')

build() {
  cd testfixtures
  python -m build --wheel --no-isolation
}

check() {
  cd testfixtures
  PYTHONPATH="$PWD/src" pytest --ignore=build
}

package() {
  cd testfixtures
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
