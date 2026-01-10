# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pyqt5-sip
pkgver=12.17.2
pkgrel=2
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
source=(https://pypi.python.org/packages/source/P/PyQt5-sip/pyqt5_sip-$pkgver.tar.gz)
sha256sums=('7f66565c2a13d34d8ad6aad08e953d355ea3fe466d991d51aa5a0966a5289f05')

build() {
  cd pyqt5_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd pyqt5_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
