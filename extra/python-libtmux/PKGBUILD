# Maintainer: David Runge <dvzrv@archlinux.org>

_name=libtmux
pkgname=python-libtmux
pkgver=0.36.0
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
sha512sums=('2fa16a55d4b46461d1266179cfa6cf8d710fdbe435369ff195a683a96243b2b7cd2fbeb47b88e3a660c23d3ca57e1c2722bc12492c52ee0961a1c5cc99ceb093')
b2sums=('247f98ae47093090187f2d52792f850f7476427b368f46970ef3fe9bd6449c03ac23101c8c7af711167bbd92e9e2cff3754474375dabd48157154ed89975a71a')

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
