# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=16.3
pkgrel=1
pkgdesc="A plugin for py.test that re-runs failed tests to eliminate intermittent failures"
arch=(any)
url="https://github.com/pytest-dev/pytest-rerunfailures/"
license=(MPL-2.0)
depends=(
  python
  python-packaging
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest-xdist
)
optdepends=(
  'python-pytest-xdist: for recovering from crashes'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('edac7f4ec54d15f0f460b9a87af7808055f1375cf56939620fb57c2ab386a1030a14217621934b0ba6ddaf5b1a6bf21bad27256b8c1bf858ab2dc09bb21267d5')
b2sums=('6f214e6b833db89c7bb841116514eb1cca3ace2f5d55e6a8662cf7c68e2659c5109948db2e9f3b9bb92cba689643f854a03f00965073a4ffdfe42eaf9054b0a2')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
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
  install -vDm 644 {CHANGES.rst,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
