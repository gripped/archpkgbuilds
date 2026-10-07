# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-flufl.bounce
_name="${pkgname#python-}"
pkgver=5.1.0
pkgrel=1
pkgdesc="Email bounce detectors"
arch=(any)
url="https://gitlab.com/warsaw/flufl.bounce"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-sybil
)
provides=(python-flufl-bounce)
replaces=(python-flufl-bounce)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('0b5794ad7cd21b2c6209600b58df9bb883e91ffa9b9fb31a2a045f48c280d0b2b0274330ebc12ff55e022cfe62a6a21214aef49f6b04b6d64ee7862aff8222e0')
b2sums=('cfc7fedcf9512eda1318aa87eff1d67414e3b8af3ee8840682c5799c5876dbc565ed0ff8359b6fa300a5864f23528c3c7ec4fb3d2fd77378e75d3ecfadda142f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )

  cd $_name-$pkgver
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
