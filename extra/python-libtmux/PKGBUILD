# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.46.1
pkgrel=1
pkgdesc="Python api for tmux"
arch=(any)
url="https://libtmux.git-pull.com/"
_url="https://github.com/tmux-python/libtmux"
license=(MIT)
depends=(
  python
  python-typing_extensions
  tmux
)
makedepends=(
  python-build
  python-installer
  python-hatchling
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  procps-ng
)
optdepends=('python-pytest: for pytest plugin')
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('41b526d40373d1251260cea8e4fc94cb176275f2c399030b66266663e831f733fb017bebc32e92b9809212c064b21e539853ec780b8f75f0afe01db8b5cb2236')
b2sums=('b0e086aab882c9ec82ee5606a7ea02e81a549d3009bf8b0f4bc736d8ba8cc7130afd024781c95e332527bdb72202346558d90a4989c5ff2cbb7f6836960e88ef')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    -vv
    # we do not want to package python-gp-libs: https://github.com/tmux-python/libtmux/issues/496
    -o addopts=''
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages"
  pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
