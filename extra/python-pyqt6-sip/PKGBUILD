# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pyqt6-sip
pkgver=13.12.0
pkgrel=1
arch=(x86_64)
pkgdesc='The sip module support for PyQt6'
url='https://riverbankcomputing.com/software/pyqt/intro'
license=(BSD-2-Clause)
depends=(glibc
         python)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel)
source=(https://pypi.python.org/packages/source/P/PyQt6-sip/pyqt6_sip-$pkgver.tar.gz)
sha256sums=('a7ad45c1e3cec3a2473d37ea9870b6c3baeccc560298623c8eb59265714c06e2')

build() {
  cd pyqt6_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd pyqt6_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
