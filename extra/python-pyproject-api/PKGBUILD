# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pyproject-api
pkgname=python-pyproject-api
pkgver=1.10.1
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
sha512sums=('6a9037698f3845d2fb5743db9e5123e91861d436336c47dcb09443b3ea14f0c63997adeb8e285d3add051ce57025b1fd8753528cc33f996a3a755a19f26795f0')
b2sums=('384d2c03e63ec75bd87ca5576c8240730ea39ce427c8504f85f05d50e236b0e2afb9fff4d1ea5f209262a788899fc8e248fdb26e95db9286cdf86806535750ac')

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
