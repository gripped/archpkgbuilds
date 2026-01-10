# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-cramjam
pkgver=2.11.0
pkgrel=2
pkgdesc="Thin Python bindings to de/compression algorithms in Rust"
arch=(x86_64)
url="https://github.com/milesgranger/cramjam"
license=(MIT)
depends=(
  bzip2
  gcc-libs
  glibc
  python
)
makedepends=(
  cmake
  nasm
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-numpy
  python-pytest
)
options=(!lto)
source=("$url/archive/v$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('542ea349a7528d88935856d3eb562cd17bff713d7a41eab8d6812d78a3cb00ba')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vv --ignore=benchmarks/ \
    --deselect='tests/test_variants.py::test_variants_decompress_into[brotli-File-Buffer]' \
    --deselect='tests/test_variants.py::test_variants_decompress_into[lz4-Buffer-Buffer]'
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
