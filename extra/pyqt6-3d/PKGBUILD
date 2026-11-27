# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-3d
pkgname=(python-pyqt6-3d)
pkgver=6.12.1
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
sha256sums=('a108137f846cad90a3cc8ffd0908e73aa3eefc08f3ad0e257391799bbce1fa88')

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
