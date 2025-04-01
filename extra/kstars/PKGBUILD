# Maintainer: Felix Yan <felixonamrs@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kstars
pkgver=3.7.6
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
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kcrash5
         ki18n5
         kio5
         knewstuff5
         knotifications5
         knotifyconfig5
         kplotting5
         kwidgetsaddons5
         kxmlgui5
         libindi
         libnova
         libraw
         libxisf
         opencv
         qt5-base
         qt5-datavis3d
         qt5-declarative
         qt5-quickcontrols
         qt5-svg
         qt5-websockets
         qtkeychain-qt5
         stellarsolver
         wcslib
         zlib)
makedepends=(eigen
             extra-cmake-modules
             kdoctools5)
optdepends=('xplanet: XPlanet support')
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('ea1c163260062899a574bf1e4cb433cc1b2e9a4e6d845a2a1af9b6756934269a'
            'SKIP')
validpgpkeys=(259D9FCEE9175351965633696D9CE2AEE028C4F3) # Jasem Mutlaq <mutlaqja@ikarustech.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
