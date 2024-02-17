# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.31.0.post0
_pkgver=${pkgver/.post0/post0}
pkgrel=1
pkgdesc="Python api for tmux"
arch=(any)
url="https://libtmux.git-pull.com/"
_url="https://github.com/tmux-python/libtmux"
license=(MIT)
depends=(
  python
  python-typing-extensions
  tmux
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  procps-ng
)
optdepends=('python-pytest: for pytest plugin')
source=($_name-$_pkgver.tar.gz::$_url/archive/refs/tags/v$_pkgver.tar.gz)
sha512sums=('0815c304ff4e0db909005418ced00b7ec6541902acd71733240f83f521b06afbaa93d36fa3d8fa22699077f0e5b7eb5fd5b96fa8c8d12a7bed2e63f16322fd29')
b2sums=('172a390ce90c51d74aa113d9147ad08f0b3ac9297e087dc96abf58670b3f1f770e79b5411a972939b48116282c30b644a111cec44dce68ee8156712ca150e638')

prepare() {
  cd $_name-$_pkgver
  # we do not want to package python-gp-libs: https://github.com/tmux-python/libtmux/issues/496
  sed '/addopts/d' -i pyproject.toml
}

build() {
  cd $_name-$_pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    --deselect tests/test_pane.py::test_capture_pane_start
    -vv
  )
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$_pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages"
  pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$_pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm 644 {CHANGES,README.md} -t "$pkgdir/usr/share/doc/$pkgname"
}
