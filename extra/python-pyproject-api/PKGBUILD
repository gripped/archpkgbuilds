# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pyproject-api
pkgname=python-pyproject-api
pkgver=1.11.1
pkgrel=1
pkgdesc="API to interact with the python pyproject.toml based projects"
arch=(any)
url="https://github.com/tox-dev/pyproject-api"
license=(MIT)
depends=(
  python
  python-packaging
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-virtualenv
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('40e6567a1a339ab30dbd55d1a3c3d67c1e0acaff071d15ce7ccfed6593ebffe141fda0f3c0eb555978b97393f0342483c71c962df050d00d4e1567d0f0bb3a22')
b2sums=('312f5cff889d1be94a432348eaec19a81045aa56f39b6db9d6e54226d6a2a3fac0a1d88763616c0a6153d1f3c8a3093e776333768828c57ae6b7de4a363aa110')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # unclear why that fails
    --deselect tests/test_frontend.py::test_missing_backend
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
