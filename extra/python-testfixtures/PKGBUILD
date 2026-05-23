# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testfixtures
pkgver=12.0.0
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
sha512sums=('a0f07531c4bada6875df476e46b9f3fdb3d8be7e71b967a86df19333612958a80a866bb463876a2b2c9d8e87ddeee889d413ddd49420243508c4ae7aa0df254e')

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
