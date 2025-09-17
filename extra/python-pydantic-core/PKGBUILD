# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.33.2
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
    python-pydantic-core-2.38.0-fix-tests-with-pytest-8_4.patch
)

sha512sums=('01499771012264d4cc7de3942608e07efffc9f8d22f68271f80b4933ee12c5c167095f1a74f079863e7d21ab68d1498c4eec8403be9b5da043b9bd9e0266873e'
            '03346a32895a9b3af2a3b08ada81027b5241d2b752fdd07926ed2ae2af1156608fa8da38436efc0158ebb6578f54743eb24f75272c6bc80a702634243d1b66a9')
b2sums=('7be741ae932a977c8df004326bff74d5e726542474a5d906ef4226a7e90add08e6cfc584495c9658cba6c32480e0ba17d2cc7b5c8a63706b40f87aa060c53711'
        '1697265d8a960949d9a1886e3cc958a80e3112f089794888fb4d94178478708ef55364db83b43087f010a313edadfdaedf932f16ed8aabc094cfd5bf0a0e8580')

prepare() {
  cd $_name-$pkgver
  # we don't support version pinning
  sed -e 's/,!=4.7.0//g' -i pyproject.toml
  patch -Np1 tests/validators/test_arguments.py ../python-pydantic-core-2.38.0-fix-tests-with-pytest-8_4.patch
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
