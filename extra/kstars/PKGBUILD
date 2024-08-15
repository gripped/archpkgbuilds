# Maintainer: Felix Yan <felixonamrs@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kstars
pkgver=3.7.2
pkgrel=1
epoch=1
pkgdesc='Desktop Planetarium'
url='https://kde.org/applications/education/kstars/'
arch=(x86_64)
license=(GPL LGPL FDL)
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
sha256sums=('7c4bb7046056e5c82b637f33041de22f4fd246ba1b12d255b0635644db53e34b'
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
