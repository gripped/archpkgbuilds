# Maintainer: Felix Yan <felixonamrs@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kstars
pkgver=3.7.7
pkgrel=3
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
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig}
        fix-platesolving-377.diff)
sha256sums=('f2dbd6c26c45512aa7c3924f0bf0606a8ef978e468c54505dcc0cb2fe1200245'
            'SKIP'
            'ede1fb564d22b63c356577b26ad917349bb880bfe6f9d24c08e4f2e65557c5d0')
validpgpkeys=(259D9FCEE9175351965633696D9CE2AEE028C4F3) # Jasem Mutlaq <mutlaqja@ikarustech.com>

prepare() {
# Fix data install dir
  sed -e 's|DATA_INSTALL_DIR|CMAKE_INSTALL_DATADIR|g' -i $pkgname-$pkgver/kstars/data/*/CMakeLists.txt
# use human readable (HMS/DMS) values for OBJCTRA/OBJCTDEC
  patch -p1 -d $pkgname-$pkgver < fix-platesolving-377.diff
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
