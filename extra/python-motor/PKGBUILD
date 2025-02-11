# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-motor
_pkgname=${pkgname#python-}
pkgver=3.7.0
pkgrel=1
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
sha256sums=('7189219542841fee3e0ee4222c7c1f50391294fdd7507d294b197a9c7123c32b')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
