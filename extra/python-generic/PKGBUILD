# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-generic
pkgver=1.1.5
pkgrel=2
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
b2sums=(6ebaa4aeb375ebac41206ce3ed919f635e4bcd38cba0fd102d1a726cf5a5872827bebae88c04f7cd29e10504a900b281995f13790484ce991172250c2700188f)

prepare() {
  cd generic

  # https://github.com/gaphor/generic/pull/560
  git cherry-pick -n e76c7f56f55846ca21a17b56634dccae0dc9ffa1
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
