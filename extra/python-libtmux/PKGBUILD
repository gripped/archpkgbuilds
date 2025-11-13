# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.47.0
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
sha512sums=('7302b955602e4a0869cc6f676a24baac555ef861e1db0d8bbed0008fda368cc42ebee78c7fefbcfa44ca5587843ff6b53ac13c7762aab45e9f710c4fac7e4b89')
b2sums=('3372a0cb7fff2723ac21c364b1be813f4b47c346a09375cb0ee219abed152c5e9b2fe812a9c48183f531a173076911dbed246b12f9bbfd293c3b1856aef325d9')

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
