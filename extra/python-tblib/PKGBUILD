# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-tblib
pkgver=3.2.0
pkgrel=1
pkgdesc='Python traceback fiddling library'
arch=('any')
url='https://github.com/ionelmc/python-tblib'
license=('BSD-2-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b9dbd7aad8eab0ad7170ee4b97f048b2ce7413bf83dd13ffe4e0c20900ad879514150c61e85ab4be8a9da36b3302d149b01bd9b37e7f016113041462d1aa3491')
b2sums=('affd50e047c37b23687653574f75d3223509db0aaacf7ed76cfe9f2cbda19ca9651bd625291a60c29501b4c0858a960966dcdafbd619a9ba793636bd82a9dbe7')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  export PYTHONNODEBUGRANGES=yes
  test-env/bin/python -m pytest --override-ini="addopts=" \
    --deselect tests/test_perf.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
