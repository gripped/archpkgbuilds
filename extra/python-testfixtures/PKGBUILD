# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=12.0.1
pkgrel=1
pkgdesc="A collection of helpers and mock objects that are useful when writing unit tests or doc tests"
arch=('any')
license=('MIT')
url="https://github.com/Simplistix/testfixtures"
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-sybil' 'python-pytest-django' 'python-django'
              'python-loguru' 'python-pandas' 'python-polars' 'python-structlog'
              'python-twisted')
source=("git+https://github.com/Simplistix/testfixtures.git#tag=$pkgver")
sha512sums=('08dc7cf19ed6fc5d99d4d59f589d9141165cbcc6f2ade2ece194e8c02e7a59338e4e58f491339f6e3528fc9db9aeee483df5efade2ff3c03d1432ec06b243d9f')

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
