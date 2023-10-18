# Maintainer: David Runge <dvzrv@archlinux.org>

_name=diff_cover
pkgname=python-diff-cover
pkgver=8.0.0
pkgrel=1
pkgdesc="Automatically find diff lines that need test coverage"
arch=(any)
url="https://github.com/Bachmann1234/diff_cover"
license=(Apache)
depends=(
  python
  python-chardet
  python-jinja
  python-pluggy
  python-pygments
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-tomli
)
optdepends=('python-tomli: for TOML support')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('d3be65aa84743f7dfe1b92c2f25b9056f1c4f81fb04cc6e6978dc84d1e1b3977501352bc4ec2e9fb573f237445e08ae88b49fecaf4d2033707720908857822e1')
b2sums=('682d0ab225f535d95cb30c0ed9fe8d0e20790d55a2a4824c9c2d36a6bad82c74e2c4ef3aff7bd6c8c5a2a96d3527a0586edee902f8d63606ea04d89aeb722967')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  # ignore integration and code style checks
  pytest -vv --ignore 'tests/test_integration.py' --ignore 'tests/test_violations_reporter.py' --ignore 'tests/test_clover_violations_reporter.py'
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
