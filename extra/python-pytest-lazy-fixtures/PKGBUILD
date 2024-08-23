# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-lazy-fixtures
pkgver=1.1.0
pkgrel=1
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/dev-petrov/pytest-lazy-fixtures"
license=(MIT)
depends=(python python-pytest)
makedepends=(python-build python-installer python-poetry-core)
source=(https://github.com/dev-petrov/pytest-lazy-fixtures/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8df996a6cd3982d954f4f7f928d4e6e86edfd7b5563ca5c84742934707942202')

build() {
  cd pytest-lazy-fixtures-$pkgver
  python -m build -nw
}

check() {
  cd pytest-lazy-fixtures-$pkgver
  PYTHONPATH="$PWD" pytest -p pytest_lazy_fixtures.plugin
}

package() {
  cd pytest-lazy-fixtures-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
