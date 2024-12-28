# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Thomas Conneely <tc116 at le dot ac dot uk>

pkgname=python-bitstring
_pkgname=${pkgname#python-}
pkgver=4.2.3
pkgrel=3
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
source=(
  "$url/archive/$_pkgname-$pkgver.tar.gz"
  "update-bitarray-dependency.patch::$url/commit/6132b121df612efa12180f2cd6242ec32a70d80d.patch"
)
sha256sums=('38a4275c6b23a60addf5a94d952fae5fe1f81cd76a2258c6380f1f3b2a17d0f3'
            '4815e7c8bc0aa5c3a2ecea274c8d98766b867c49fe6b36bc91e088b9f882e8d5')

prepare() {
  cd "$_pkgname-$_pkgname-$pkgver"
  patch -Np1 -i ../update-bitarray-dependency.patch
}

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
