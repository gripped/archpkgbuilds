# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-cramjam
pkgver=2.10.0
pkgrel=1
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
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('77a835c97018b1228aa51fd95acde8d343a346d1dcaa47f660d9ffac502407b6')

build() {
  cd ${pkgname#python-}-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vv --ignore=benchmarks/ \
    --deselect='tests/test_variants.py::test_variants_decompress_into[brotli-File-Buffer]'
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
