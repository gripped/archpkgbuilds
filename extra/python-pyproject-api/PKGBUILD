# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pyproject-api
pkgname=python-pyproject-api
pkgver=1.12.3
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
sha512sums=('71a11589372938cfd6f1a1eaa15b903b05f099c81ff9082465d4fe9d276028a7ea51c0bf45d8ac94c4483cbd465b51226a1a001de2d278694a4af3d74d62d824')
b2sums=('94dcb8a3661d0be95734a393185fa4f75ff791fed3bf68da40d77444ded99d18a4a101957ba96e920fd371b86747ccf1a97e8b6df174cf7a7a1c43286eb93788')

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
