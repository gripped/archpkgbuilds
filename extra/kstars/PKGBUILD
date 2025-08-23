# Maintainer: Felix Yan <felixonamrs@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kstars
pkgver=3.7.8
pkgrel=1
epoch=1
pkgdesc='Desktop Planetarium'
url='https://kstars.kde.org/'
arch=(x86_64)
license=(GPL-2.0-or-later
         LGPL-2.1-or-later)
depends=(breeze-icons
         cfitsio
         gcc-libs
         glibc
         gsl
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         ki18n
         kio
         knewstuff
         knotifications
         knotifyconfig
         kplotting
         kwidgetsaddons
         kxmlgui
         libindi
         libnova
         libraw
         libxisf
         opencv
         qt6-base
         qt6-datavis3d
         qt6-declarative
         qt6-svg
         qt6-websockets
         qtkeychain-qt6
         stellarsolver
         wcslib
         zlib)
makedepends=(eigen
             extra-cmake-modules
             kdoctools)
optdepends=('xplanet: XPlanet support')
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('55b3aef29ec1aba50906bd393d565e8a7e0b5b3a5d2e8e3cdfc1b58d718d2c0c'
            'SKIP')
validpgpkeys=(259D9FCEE9175351965633696D9CE2AEE028C4F3) # Jasem Mutlaq <mutlaqja@ikarustech.com>

prepare() {
# Fix data install dir
  sed -e 's|DATA_INSTALL_DIR|CMAKE_INSTALL_DATADIR|g' -i $pkgname-$pkgver/kstars/data/*/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
