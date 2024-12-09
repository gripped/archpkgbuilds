# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pyqt6-sip
pkgver=13.9.0
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
source=(https://pypi.python.org/packages/source/P/PyQt6-sip/PyQt6_sip-$pkgver.tar.gz)
sha256sums=('5dc660f2242f6bd8c6bc5973a39f31a5b97f261f5ba69b4571912c7feae346bb')

build() {
  cd PyQt6_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd PyQt6_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
