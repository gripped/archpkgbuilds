# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=16.2
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
sha512sums=('20bffba90c80fa78ba6429850288a06b2d284f7b1a453bf4c8d5cace1e545cdee7fdcca5c73775ed4b2585015f9e542de482b2bfd0cfb75db65f9852da77e7f8')
b2sums=('52842a335556f9dcdc50ca20081539fed7627c713bb78d035f8e44daea3863948bbab9f293d57c2d4ea91bc39125e6e581516a5e9cf02fbaf563ad96ba00d4d3')

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
