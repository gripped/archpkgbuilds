# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=mpvqt
pkgver=1.2.1
pkgrel=1
pkgdesc='A libmpv wrapper for QtQuick2 and QML'
license=(LGPL-2.1-only
         LGPL-3.0-only)
arch=(x86_64)
url='https://invent.kde.org/libraries/mpvqt'
depends=(glibc
         libglvnd
         libstdc++
         mpv
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('6ff5f56a0edd8248073446e5cc038f47d4b17c46b6af43cf438123d0ac911189'
            'SKIP')
validpgpkeys=(4E421C6554B89766DF9B7A37E12AB207C8755905) # George Florea Bănuș <georgefb899@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
