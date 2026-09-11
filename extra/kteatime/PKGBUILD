# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kteatime
pkgver=26.08.1
pkgrel=1
pkgdesc='A handy timer for steeping tea'
url='https://apps.kde.org/kteatime/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(glibc
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         ki18n
         knotifications
         knotifyconfig
         kstatusnotifieritem
         ktextwidgets
         kxmlgui
         libstdc++
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(kde-applications
        kde-utilities)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('4b047d3c4682b05a12b8e93f8ec2506b5911e31d812d30755ec24c3a7b1b2572'
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
