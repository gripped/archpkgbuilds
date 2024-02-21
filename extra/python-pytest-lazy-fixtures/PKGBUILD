# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-lazy-fixtures
pkgver=1.0.5
pkgrel=1
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/dev-petrov/pytest-lazy-fixtures"
license=(MIT)
depends=(python python-pytest)
makedepends=(python-build python-installer python-poetry-core)
source=(https://github.com/dev-petrov/pytest-lazy-fixtures/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c99e8969a67d2e2a2cefc7f36151dcb5b52e0c4080e538775ead9ff349eebc2c')

build() {
  cd pytest-lazy-fixtures-$pkgver
  python -m build -nw
}

check() {
  cd pytest-lazy-fixtures-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd pytest-lazy-fixtures-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
