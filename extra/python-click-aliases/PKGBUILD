# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-aliases
pkgname=python-click-aliases
pkgver=1.0.6
pkgrel=1
pkgdesc="Enable aliases for click"
arch=(any)
url="https://github.com/click-contrib/click-aliases"
license=(MIT)
depends=(
  python
  python-click
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
)
source=(git+https://github.com/click-contrib/click-aliases.git#tag=v$pkgver)
sha512sums=('080672d89e749243cfdf808c6415de4158f3ff05d8259ccc4f6ca8302677fa67aa8eea23fbdbca91d4fb8713da72be60f21409487868d0b67be1b86e00517218')
b2sums=('d29b93e0b66e434009de1c91019f17bd3c3563a6957cbfb86a3889d2d5580b07e155c5e76fb4f19e53bb79ee3ee0b6e628af6a6b992f1d510d3dbb8b4bec779f')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable broken tests (due to undead project): https://github.com/click-contrib/click-aliases/issues/5
    --deselect tests/test_basic.py::test_invalid
    --deselect tests/test_foobar.py::test_invalid
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
