# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pytest-rerunfailures
pkgname=python-pytest-rerunfailures
pkgver=16.4
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
sha512sums=('29d9d59a105be82f12b3a6186ace0030cae95b008e38eaf1785af7530ac863b781236d469b91f7690265f4de755b9068f4415f5afb9dc1711633e124a62ab38e')
b2sums=('87129dbe465df64f5f0d0ede6aaf05a64f5d08f9219b4f5d539f99eb170da5317398bef4860d090f23507e14cb794133b2b075a2b86d31cf8310bb4597b2540c')

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
