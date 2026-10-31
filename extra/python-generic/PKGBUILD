# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-generic
pkgver=1.1.8
pkgrel=1
pkgdesc='Generic programming library for Python'
arch=(any)
url='https://github.com/gaphor/generic'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-sphinx-furo
  python-wheel
)
checkdepends=(python-pytest)
source=("git+https://github.com/gaphor/generic.git#tag=$pkgver")
b2sums=(b42adcaba12e8efc24ce58425bafd2cec9ecaa4a1df657d8aeffc0d7fe0f3e9813a7781c525af9b3144018f8a9552b0056b3bfde9a04b72e76d3b3eb7c56afb6)

prepare() {
  cd generic
}

build() {
  cd generic
  python -m build --wheel --no-isolation
}

check() {
  cd generic
  PYTHONPATH="$PWD/dist/generic-$pkgver-py3-none-any.whl" \
    pytest
}

package() {
  cd generic
  python -m installer --destdir="$pkgdir" dist/*.whl

  PYTHONPATH="$PWD/dist/generic-$pkgver-py3-none-any.whl" \
    python -m sphinx -b html docs "$pkgdir/usr/share/doc/$pkgname/html"
  rm -r "$pkgdir/usr/share/doc/$pkgname/html/.doctrees"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSES/BSD-3-Clause.txt
}
