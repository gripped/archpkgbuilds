# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=python-owslib
pkgver=0.34.1
pkgrel=2
pkgdesc='Python package for client programming with Open Geospatial Consortium (OGC) web service interface standards, and their related content models'
arch=(any)
url='https://geopython.github.io/OWSLib/'
license=(BSD)
depends=(python-dateutil python-lxml python-requests python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://github.com/geopython/OWSLib/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ea3c0a74bda00dd1760acfe5db87a0b02e1b7c201646fa4d2f93f35842451ea5')

build() {
  cd OWSLib-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd OWSLib-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
