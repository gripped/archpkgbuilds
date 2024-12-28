# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-motor
_pkgname=${pkgname#python-}
pkgver=3.6.0
pkgrel=3
pkgdesc="Async Python driver for MongoDB and Tornado or asyncio"
arch=(any)
url="https://github.com/mongodb/motor"
license=(Apache-2.0)
depends=(
  python
  python-pymongo
)
makedepends=(
  python-build
  python-hatch-requirements-txt
  python-hatchling
  python-installer
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ca2701e1f0ac4cac26641b4bb71e3945003128082287e53c2ee07e08f4daff5c')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
