# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-lazy-fixtures
pkgver=1.3.4
pkgrel=1
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/dev-petrov/pytest-lazy-fixtures"
license=(MIT)
depends=(python python-pytest)
makedepends=(git python-build python-installer python-hatchling)
checkdepends=(python-pytest-deadfixtures python-pytest-fixture-classes)
source=(git+https://github.com/dev-petrov/pytest-lazy-fixtures.git#tag=$pkgver)
sha256sums=('be291d4420ec3fa3d844ae0eaa2802b3a9d19d4b1f76ad7569daa84b53fd3c9c')

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
