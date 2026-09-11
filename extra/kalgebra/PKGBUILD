# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kalgebra
pkgver=26.08.1
pkgrel=1
pkgdesc='Graph Calculator'
url='https://apps.kde.org/kalgebramobile/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(analitza
         glibc
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         ki18n
         kio
         kwidgetsaddons
         kxmlgui
         libstdc++
         qt6-base
         qt6-declarative
         qt6-webengine
         readline)
makedepends=(extra-cmake-modules
             kdoctools
             libplasma)
optdepends=('kirigami-addons: for KAlgebra Mobile')
groups=(kde-applications
        kde-education)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e8740deba96ba4d47079695a34f41850a080a631ba318fab88e9d744825d92ae'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
