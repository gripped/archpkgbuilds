# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.32.0
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
sha512sums=('daa97cdba7c07ea35c8658263a6dc3a533b6422449a31d83cb3cac4c47c2be32f3c60556ea05e5d098c090582697de0192725453d61e89ecc31f79309b1700ac')
b2sums=('c6b98925f258fb5a2c25b08ee835faf6f1189413041e592da396d0934ad712d3494c8b0985352f96fff998ecd051c0cc433377697333a88225f55392d3a1971b')

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
