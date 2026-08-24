# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=16.6
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
sha512sums=('dfec0db9d6e8b1f7147c1a4b856a5f3a9cb4d8390e134b8cbe391bceb8adb5f31359de9cc225ae3990b3b2c93e96a5039d09992fd8ab2d7d003af1a431f3f5ea')
b2sums=('b3dff4906a3683580e08904b57229fe9d631694d55498c7e3f61dab078e8d046dcbb2f9ac49445f92da836bb5a5259854bd9f951850e2015bf4587969ba812f3')

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
