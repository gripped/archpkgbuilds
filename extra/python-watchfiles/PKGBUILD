# Maintainer:
# Contributor: @RubenKelevra <cyrond@gmail.com>

pkgname=python-watchfiles
_name=${pkgname#python-}
pkgver=0.23.0
pkgrel=1
pkgdesc='Simple, modern and high performance file watching and code reload in python'
arch=(x86_64)
url='https://github.com/samuelcolvin/watchfiles'
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-anyio
)
makedepends=(
  python-build
  python-installer
  python-maturin
)
checkdepends=(
  python-dirty-equals
  python-pytest
  python-pytest-mock
  python-pytest-timeout
)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('c413955207007cd461e8bc420a00a624c132216ff13599d342f20c10e0ba60a45a723758d8669c216054cc7d7a4057750ad11b919026849f943cab67fcf93d96')

prepare() {
  # remove __init__.py otherwise this prevents tests detecting the watchfiles module anywhere else
  rm -v $_name-$pkgver/tests/__init__.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=''
    --deselect tests/test_watch.py::test_awatch_interrupt_raise
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}" .
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
