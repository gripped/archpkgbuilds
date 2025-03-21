# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=libusb1
pkgname=python-$_pkgname
pkgver=3.3.0
pkgrel=1
pkgdesc='Python ctype-based wrapper around libusb1'
arch=('any')
url='https://github.com/vpelletier/python-libusb1'
license=('LGPL2.1')
depends=('python' 'libusb')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1c911d67a209052f682f329119149a4d92afc4aefef70d6bb80d90384a8294ade153bacc9f656ba05710b34c20c6929184187ee881e910271182ae917e1f3c62')

build() {
  cd $pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
