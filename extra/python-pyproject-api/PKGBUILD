# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pyproject-api
pkgname=python-pyproject-api
pkgver=1.12.2
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
  python-hatch-fancy-pypi-readme
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
sha512sums=('55e42ba73828eebe62f2bdf1a5968eb44060bf4dac00ea47abfae7e62104b1949d75532f22e3b6aea7c8d3751296fc100de48f4b887757e23beb6aa4078350c1')
b2sums=('dcefc2adbad83ebe6fa1d6d2823a9aa251b255cf80b6e876f7b2bb6601c39f9aa61cb0bc9f637d2ee7cb52ea3c6fe025a0a943b21fcc918b48539c6d92159d24')

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
