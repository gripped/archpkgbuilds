# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_name=pytest-httpserver
pkgname=python-pytest-httpserver
pkgver=1.1.1
pkgrel=1
pkgdesc="Http server for pytest to test http clients"
arch=(any)
url="https://github.com/csernazs/pytest-httpserver"
license=(MIT)
depends=(
  python
  python-pytest
  python-werkzeug
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-requests
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('5bb290b1b2fb08a624acb5e47c47715f32782c739d6b617f8168ad8bd1a1927c')
b2sums=('5de3d60d31b29b298326757c25cfb3ad7af5904e19f0ed777372b9ae42ed6cb1252b8f10a808185f91e97b12bab8a288d9d3dad32f54bf74491dcb14e1738d02')

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
  pytest -vv --ignore tests/test_release.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGES.rst README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
