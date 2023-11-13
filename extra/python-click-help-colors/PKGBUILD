# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-help-colors
pkgname=python-click-help-colors
pkgver=0.9.3
pkgrel=1
pkgdesc="Colorization of help messages in Click"
arch=(any)
url="https://github.com/click-contrib/click-help-colors"
license=(MIT)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('7d3708ea710de41baca075468e5d434f5536d04ceb1092085c46cccc31f58d16f6ed1095efca1d9dc6bd1e5532a41e8bde4343d8197744fca58642dd80a03c59')
b2sums=('612789519501858ee8ed415b274b426273b6e4c48b9f650f966f0ee2774c97531c5bbbbf7e0e6edb08f50821635212a04f920a2a26d8897db9dd9413c3999bfd')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.py -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
