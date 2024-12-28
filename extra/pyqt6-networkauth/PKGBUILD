# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-networkauth
pkgname=(python-pyqt6-networkauth)
pkgver=6.8.0
pkgrel=2
pkgdesc='Python bindings for QtNetworkAuth'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtnetworkauth/intro'
license=(GPL3)
groups=(pyqt6)
depends=(gcc-libs
         glibc
         python
         python-pyqt6
         qt6-base
         qt6-networkauth)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-NetworkAuth/PyQt6_NetworkAuth-$pkgver.tar.gz)
sha256sums=('2a1043ff6d03fc19e7bc87fad4f32d4d7e56d2bf1bb89b2a43287c0161457d59')

build() {
  cd PyQt6_NetworkAuth-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-networkauth(){
  cd PyQt6_NetworkAuth-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
