# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=python-owslib
pkgver=0.35.0
pkgrel=1
pkgdesc='Python package for client programming with Open Geospatial Consortium (OGC) web service interface standards, and their related content models'
arch=(any)
url='https://geopython.github.io/OWSLib/'
license=(BSD)
depends=(python-dateutil python-lxml python-requests python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://github.com/geopython/OWSLib/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f355481fa0dc4660707f3979d0de5dce480b515370a5a2ffb6488f84667541ea')

build() {
  cd OWSLib-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd OWSLib-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
