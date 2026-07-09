# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.61.0
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
sha512sums=('a045104a943414ad92c3fd06ef3b2a82ec5dcfe317814c4c7d68b32935510fff8734570ccc29154803fe650d0c6f149d17c424acb8aff0eddcec47bafc505553')
b2sums=('c2a286d12fb9173a3b4b557ed7d4bdae7d95107974271187548462bd35834d8c1d1a020ee3ad69cd7c262ec02ebb9ca5b2c1d300df0c22e65a102618be6065d5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    --deselect tests/test_pane.py::test_capture_pane
    --deselect 'tests/test_pane_capture_pane.py::test_capture_pane_flags[join_wrapped_numbers]'
    --deselect tests/test_pane.py::test_set_title
    --deselect tests/test_control_mode.py::test_control_mode_stdout_preserves_non_ascii_output
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
