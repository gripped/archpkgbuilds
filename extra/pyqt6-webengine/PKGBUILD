# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-webengine
pkgname=(python-pyqt6-webengine)
pkgver=6.10.0
pkgrel=2
pkgdesc='Python bindings for QtWebEngine'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtwebengine/intro'
license=(GPL3)
groups=(pyqt6)
depends=(gcc-libs
         glibc
         python
         python-pyqt6
         qt6-base
         qt6-webengine)
makedepends=(pyqt-builder
             sip)
source=(https://pypi.python.org/packages/source/P/PyQt6-WebEngine/pyqt6_webengine-$pkgver.tar.gz)
sha256sums=('267d27275d0c79ae270bca4b03520a41fa7e85c2a4d9632da8cb9cc233a55ad1')

build() {
  cd pyqt6_webengine-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-webengine() {
  cd pyqt6_webengine-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
