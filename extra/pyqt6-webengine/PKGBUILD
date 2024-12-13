# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-webengine
pkgname=(python-pyqt6-webengine)
pkgver=6.8.0
pkgrel=1
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
source=(https://pypi.python.org/packages/source/P/PyQt6-WebEngine/PyQt6_WebEngine-$pkgver.tar.gz
        fix-build.patch)
sha256sums=('64045ea622b6a41882c2b18f55ae9714b8660acff06a54e910eb72822c2f3ff2'
            '14b523cf26fd6e066ed1900fd59e1e6f8d7abc5900a04fc5b9bc9f3cb831045f')

prepare() {
  cd PyQt6_WebEngine-$pkgver
  patch -p1 -i ../fix-build.patch
}

build() {
  cd PyQt6_WebEngine-$pkgver
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake6 \
    --pep484-pyi
  cd build
  make
}

package_python-pyqt6-webengine() {
  cd PyQt6_WebEngine-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
