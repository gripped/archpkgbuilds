# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-aliases
pkgname=python-click-aliases
pkgver=1.0.5
pkgrel=3
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
sha512sums=('389246e5cb8d07af6b6379d8d585cfdf127dc4aeba67882cfe30b338459296a2d943be09c2d0bcdf3a0a7658391b6b07724a37e46f71f30c0871873e889a6486')
b2sums=('47ece35e62a391996a9847abe3cf4cd225fd999a610802aff96e8e4dad7b5a4c28f4e93b7f6dd60597f854c536968d354839e69306745008c302ae2ccca3a7cd')

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
