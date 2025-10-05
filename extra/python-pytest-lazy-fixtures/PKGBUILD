# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-lazy-fixtures
pkgver=1.3.0
pkgrel=1
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/dev-petrov/pytest-lazy-fixtures"
license=(MIT)
depends=(python python-pytest)
makedepends=(git python-build python-installer python-hatchling)
source=(git+https://github.com/dev-petrov/pytest-lazy-fixtures.git#tag=$pkgver)
sha256sums=('f703820accf338367861530b005ddf9ab1292e48bcbe16f87470db2e42a3c3d8')

build() {
  cd pytest-lazy-fixtures
  python -m build -nw
}

check() {
  cd pytest-lazy-fixtures
  # pytest-deadfixtures is not packaged
  PYTHONPATH="$PWD" pytest -p pytest_lazy_fixtures.plugin \
    --ignore tests/test_deadfixtures_support.py
}

package() {
  cd pytest-lazy-fixtures
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
