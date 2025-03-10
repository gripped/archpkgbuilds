# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-rtree
pkgver=1.4.0
pkgrel=1
pkgdesc="Rtree: spatial index for Python GIS"
arch=(any)
url="https://rtree.readthedocs.io/en/latest/"
license=(MIT)
depends=(
  python
  spatialindex
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-numpy
  python-pytest
)
optdepends=('python-numpy: array-based bulk insert support')
source=("https://github.com/Toblerity/rtree/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8f1583f6c479cd93c8788ce33d4a822ef83e2d50499f8bdd4457e27179765f57')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
