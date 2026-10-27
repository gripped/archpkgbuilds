# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-gaphas
pkgver=5.1.3
pkgrel=1
pkgdesc='Diagramming widget library for Python'
arch=(any)
url='https://github.com/gaphor/gaphas'
license=(Apache-2.0)
depends=(
  glib2
  graphene
  gtk4
  python
  python-cairo
  python-gobject
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-sphinx-furo
  python-wheel
)
checkdepends=(
  python-pytest-asyncio
  xorg-server-xvfb
)
source=("git+https://github.com/gaphor/gaphas.git#tag=$pkgver")
b2sums=(4de7671316579956a8568535aab48ef4f1899b4c5ea2744e10d9d84cb9e9bf1838ee6808ec221526b31953e99c8cc1543db89c48b0e071fa3ccb4e61019fd57d)

build() {
  cd gaphas
  python -m build --wheel --no-isolation
}

check() {
  cd gaphas
  PYTHONPATH="$PWD/dist/gaphas-$pkgver-py3-none-any.whl" \
    dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    pytest --ignore=tests/test_architecture.py
}

package() {
  cd gaphas
  python -m installer --destdir="$pkgdir" dist/*.whl
  python -m sphinx -b html docs "$pkgdir/usr/share/doc/$pkgname/html"
  rm -r "$pkgdir/usr/share/doc/$pkgname/html/.doctrees"
}
