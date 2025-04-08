# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgbase=pyqt6-webengine
pkgname=(python-pyqt6-webengine)
pkgver=6.9.0
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
source=(https://pypi.python.org/packages/source/P/PyQt6-WebEngine/pyqt6_webengine-$pkgver.tar.gz
        fix-build.patch)
sha256sums=('6ae537e3bbda06b8e06535e4852297e0bc3b00543c47929541fcc9b11981aa25'
            '14b523cf26fd6e066ed1900fd59e1e6f8d7abc5900a04fc5b9bc9f3cb831045f')

prepare() {
  cd pyqt6_webengine-$pkgver
  patch -p1 -i ../fix-build.patch
}

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
