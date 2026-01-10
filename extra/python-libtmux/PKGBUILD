# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.53.0
pkgrel=2
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
sha512sums=('07fb4609cdb84fd5103f22dbde248a6c1bc8640057fbf93e31dd8df244886bd9fcb6bd7eb890a686b708a69a2e9436f8a0740b090678b5ad970fd962dce9a343')
b2sums=('01ee37278cabd30d32515811bc13a1f4dc1dd95e6d7b4e77c13bff14fe4eb9644f4c455f14d839f49a4af739fc99b67361f7c9e5e1fa71b0921651c59e1c23f3')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    --deselect 'tests/test_pane_capture_pane.py::test_capture_pane_flags[join_wrapped_numbers]'
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
