# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-pyqt6-sip
pkgver=13.10.3
pkgrel=2
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
sha256sums=('630895b3827e2c3b4e072089157985691fe4210d64340e71141f93775ea4ae51')

build() {
  cd pyqt6_sip-$pkgver
  python -m build --wheel --no-isolation
}

package()  {
  cd pyqt6_sip-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
