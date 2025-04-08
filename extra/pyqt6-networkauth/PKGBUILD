# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-networkauth
pkgname=(python-pyqt6-networkauth)
pkgver=6.9.0
pkgrel=1
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
source=(https://pypi.python.org/packages/source/P/PyQt6-NetworkAuth/pyqt6_networkauth-$pkgver.tar.gz)
sha256sums=('9acb6e97bd54584bbaeac2aabc40ec17a79d868f7da37a163c7bd4b7a8f04b09')

build() {
  cd pyqt6_networkauth-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-networkauth(){
  cd pyqt6_networkauth-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
