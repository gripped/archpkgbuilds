# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.35.0
_pkgver=${pkgver/.post0/post0}
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
sha512sums=('a847a5cd14f0daefaa7582610bcc5ab707aed16b73e4ff53f630bd27794dbdabf1c1d42635d30a3e3823413be79e9c2fcf3710096080b0eac3c49adecb816d59')
b2sums=('b940e3833a54f949a73e19e1c8cdb97f91300425b4eff9f5b4ed0b60bfb117d0c670f3e450937bb453e0a7c2b7c623691d1ad8c42611bc486d65992680cbed9a')

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
