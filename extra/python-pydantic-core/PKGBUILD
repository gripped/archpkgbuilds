# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.41.1
pkgrel=1
epoch=3
pkgdesc="Core validation logic for pydantic written in rust "
arch=(x86_64)
url="https://github.com/pydantic/pydantic-core"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-typing-inspection
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-maturin
)
checkdepends=(
  python-dirty-equals
  python-hypothesis
  python-inline-snapshot
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-pytest-run-parallel
  python-pytest-timeout
)
options=(!lto)
source=(
    $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz
)

sha512sums=('6874cbcf5bfc6671b372a03a2a778ca1033cf10241f536f5c62ca0217ddb3521da539d1938263f2c3ece5f4ae1dc3c7ac8ba148d4fae50b9fed03bf59c0a88e1')
b2sums=('3020bb98826f6d8f1377b78238f627eeadc476f76cfce6beb3d99982baae6aeba077e250077812d94c6e800f1b17255dc0a33a985b022eb21468987eadbf6bd7')

prepare() {
  cd $_name-$pkgver
  # we don't support version pinning
  sed -e 's/,!=4.7.0//g' -i pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docstrings.py  # we are not interested in linting/ formatting with ruff
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  HYPOTHESIS_PROFILE=slow pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
