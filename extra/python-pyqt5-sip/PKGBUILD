# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pyqt5-sip
pkgver=12.16.0
pkgrel=1
arch=(x86_64)
pkgdesc='The sip module support for PyQt5'
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(GPL)
depends=(glibc
         python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.python.org/packages/source/P/PyQt5-sip/PyQt5_sip-$pkgver.tar.gz)
sha256sums=('8cfb0345b9438a18ec1dd3952054c2ac1508bd9e306092a96df99329382e3e25')

build() {
  cd PyQt5_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd PyQt5_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
