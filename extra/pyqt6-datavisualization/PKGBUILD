# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-datavisualization
pkgname=(python-pyqt6-datavisualization)
pkgver=6.8.0
pkgrel=2
pkgdesc='Python bindings for QtDataVisualization'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro'
license=(GPL3)
groups=(pyqt6)
depends=(gcc-libs
         glibc
         python
         python-pyqt6
         qt6-base
         qt6-datavis3d)
makedepends=(pyqt-builder
             qt6-declarative
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-DataVisualization/PyQt6_DataVisualization-$pkgver.tar.gz)
sha256sums=('822a94163b8177b9dd507988aff4da7c79ce26bc47fc5f9780dea6989c531171')

build() {
  cd PyQt6_DataVisualization-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-datavisualization(){
  cd PyQt6_DataVisualization-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
