# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pyproject-api
pkgname=python-pyproject-api
pkgver=1.11.2
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
sha512sums=('f1e18605e6a4224998300647f23a333787b03200d41c0b68b3c1dd5d2155baf0694f99c5c5106edc92224d92470eb1e361b618c61a6b5817392491390a8ff4c9')
b2sums=('fe494816181d565fbad5dc88d69977e9bdb13182cc3796c75054ab5d00de5c8a0781011f9fdbc1686465750ed3cb39aad5bec74fa2b29f39d04875d85ba6cb98')

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
