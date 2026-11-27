# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-datavisualization
pkgname=(python-pyqt6-datavisualization)
pkgver=6.12.1
pkgrel=1
pkgdesc='Python bindings for QtDataVisualization'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro'
license=(GPL3)
groups=(pyqt6)
depends=(glibc
         libstdc++
         python
         python-pyqt6
         qt6-base
         qt6-datavis3d)
makedepends=(pyqt-builder
             qt6-declarative
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-DataVisualization/pyqt6_datavisualization-$pkgver.tar.gz)
sha256sums=('7f8d449ed9877081f636cc4c4e4c15554c8a08bccd00e47e85c5da3524ca0f00')

build() {
  cd pyqt6_datavisualization-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-datavisualization(){
  cd pyqt6_datavisualization-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
