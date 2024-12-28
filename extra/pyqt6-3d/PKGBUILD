# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-3d
pkgname=(python-pyqt6-3d)
pkgver=6.8.0
pkgrel=2
pkgdesc='Python bindings for Qt3D'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqt3d/intro'
license=(GPL3)
groups=(pyqt6)
depends=(gcc-libs
         glibc
         python
         python-pyqt6
         qt6-3d
         qt6-base)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-3D/PyQt6_3D-$pkgver.tar.gz)
sha256sums=('f62790a787cfc99fcd84c774fa952b83c877dd2175355a3a6609d37fe1a1c7a3')

build() {
  cd PyQt6_3D-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-3d(){
  cd PyQt6_3D-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
