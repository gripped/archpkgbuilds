# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>

_name=pytest_httpserver
pkgname=python-pytest-httpserver
pkgver=1.0.9
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
  python-ipdb
  python-pytest
  python-requests
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('9429f26c7ad7b1677dc2fa3bc9e928601f0e9b4ba0388edf961162be1242a662')
b2sums=('1eeecb67624d7ced713f0901c912a559e9e30c1875933cc799c3e6eca1e39941f8c556e053cc8d4a155e9c29f68d659560b0d6f51e57b97ed850b6d4ae9357ad')

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
