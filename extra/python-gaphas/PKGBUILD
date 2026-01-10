# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-gaphas
pkgver=5.1.1
pkgrel=3
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
b2sums=(fe258d1732a6d287acdcada00f36c7da8a7986a6e225ee7b378d9d767b16e6fb8aaedec4af26817e1f8bbce553078801e76c949c5c207b11cfa04c45bdf226d2)

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
