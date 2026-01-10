# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Thomas Conneely <tc116 at le dot ac dot uk>

pkgname=python-bitstring
_pkgname=${pkgname#python-}
pkgver=4.3.1
pkgrel=2
pkgdesc='A Python module to help you manage your bits'
arch=('any')
url="https://github.com/scott-griffiths/bitstring"
license=('MIT')
depends=(
  'python'
  'python-bitarray'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-pytest'
)
source=("$url/archive/$_pkgname-$pkgver.tar.gz")
sha256sums=('49e0fa2d0f174ca1e40711f8b443e6ba2a2e939f13cfefab508bb4ef4257aff3')

build() {
  cd "$_pkgname-$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$_pkgname-$pkgver"
  local pytest_args=(
    # Requires python-gfloat which is not yet packaged.
    # https://github.com/graphcore-research/gfloat
    --ignore=tests/test_fp8.py
    --ignore=tests/test_mxfp.py

    # Deselect to avoid dependency on python-pytest-benchmark.
    --deselect=tests/test_benchmarks.py
  )
  pytest "${pytest_args[@]}"
}

package() {
  cd "$_pkgname-$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
