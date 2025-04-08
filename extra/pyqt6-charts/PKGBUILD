# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-charts
pkgname=(python-pyqt6-charts)
pkgver=6.9.0
pkgrel=1
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
source=(https://pypi.python.org/packages/source/P/PyQt6-Charts/pyqt6_charts-$pkgver.tar.gz)
sha256sums=('7efbe9bb7e6ad4f9845211a0efe0f91ca5e14f9362ed1ba84d55f2b8515091f7')

build() {
  cd pyqt6_charts-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-charts(){
  cd pyqt6_charts-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
