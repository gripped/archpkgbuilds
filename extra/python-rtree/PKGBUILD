# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-rtree
_pkgname=${pkgname#python-}
pkgver=1.3.0
pkgrel=2
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
source=("https://github.com/Toblerity/rtree/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8829823d83658cdf5f7f7925107363f1bba31bb6a94e255124c1026c7cbbbfe7')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
