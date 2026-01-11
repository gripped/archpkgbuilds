# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-generic
pkgver=1.1.6
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
b2sums=(5a4a4aa76f09e57c436da6694bb9faba18414552b3322a929ac0ef96634b32c6b47927a12acb4de86cdc18844d75768e28e3a2400343dc785e2d3906ee99ad3c)

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
