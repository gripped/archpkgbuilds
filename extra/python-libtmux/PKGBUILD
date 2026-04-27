# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.55.1
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
sha512sums=('bbd1c3b01fab3ff22fbd898de3fad8577804dd5d2010ed68996063046dc03207b6dc647fbe840b25677a99908c9c97ed72e4fcda324f39e782c716cfa28bdd03')
b2sums=('b1de6765d06d2b68a3d6cd41a7f30a5253df253a8e9cd331b000e79d9026c3b72713f951148c8ea7a1371ba1c16112da20cbc5ddc9b5668f916cfb8291bf4a3c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    --deselect 'tests/test_pane_capture_pane.py::test_capture_pane_flags[join_wrapped_numbers]'
    --deselect tests/test_pane.py::test_set_title
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
