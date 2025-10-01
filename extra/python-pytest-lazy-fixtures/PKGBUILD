# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-lazy-fixtures
pkgver=1.2.0
pkgrel=1
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/dev-petrov/pytest-lazy-fixtures"
license=(MIT)
depends=(python python-pytest)
makedepends=(git python-build python-installer python-hatchling)
source=(git+https://github.com/dev-petrov/pytest-lazy-fixtures.git#tag=$pkgver)
sha256sums=('d7f2f07bb6c7f3b1bde066a8c600cdc0084e41a381c2c284cab05094febdbf46')

build() {
  cd pytest-lazy-fixtures
  python -m build -nw
}

check() {
  cd pytest-lazy-fixtures
  PYTHONPATH="$PWD" pytest -p pytest_lazy_fixtures.plugin
}

package() {
  cd pytest-lazy-fixtures
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
