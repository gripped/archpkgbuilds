# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-3d
pkgname=(python-pyqt6-3d)
pkgver=6.12.0
pkgrel=1
pkgdesc='Python bindings for Qt3D'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqt3d/intro'
license=(GPL3)
groups=(pyqt6)
depends=(glibc
         libstdc++
         python
         python-pyqt6
         qt6-3d
         qt6-base)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-3D/pyqt6_3d-$pkgver.tar.gz)
sha256sums=('be72460ed5e2429fc6e905fd0ff4cbc8431a56bc2d19d315ce792bfa1c0c838f')

build() {
  cd pyqt6_3d-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-3d(){
  cd pyqt6_3d-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
