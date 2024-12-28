# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-charts
pkgname=(python-pyqt6-charts)
pkgver=6.8.0
pkgrel=2
pkgdesc='Python bindings for QtChart'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtchart/intro'
license=(GPL3)
groups=(pyqt6)
depends=(gcc-libs
         glibc
         python
         python-pyqt6
         qt6-base
         qt6-charts)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-Charts/PyQt6_Charts-$pkgver.tar.gz)
sha256sums=('f86705b8740e3041667ce211aeaa205b750eb6baf4c908f4e3f6dc8c720d10f1')

build() {
  cd PyQt6_Charts-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-charts(){
  cd PyQt6_Charts-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
