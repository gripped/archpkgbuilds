# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-networkauth
pkgname=(python-pyqt6-networkauth)
pkgver=6.12.1
pkgrel=1
pkgdesc='Python bindings for QtNetworkAuth'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtnetworkauth/intro'
license=(GPL3)
groups=(pyqt6)
depends=(glibc
         libstdc++
         python
         python-pyqt6
         qt6-base
         qt6-networkauth)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-NetworkAuth/pyqt6_networkauth-$pkgver.tar.gz)
sha256sums=('a96a227f933a80ef02c5ac029b3955d1f01c3a222059d4390d32e96aa6200262')

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
