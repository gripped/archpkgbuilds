# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: André Klitzing <aklitzing () gmail () com>

pkgname=clazy
pkgver=1.15
pkgrel=1
pkgdesc='Qt oriented code checker based on clang framework'
url='https://www.kdab.com/'
license=(GPL-2.0-or-later)
depends=(clang
         gcc-libs
         glibc
         llvm-libs
         sh)
makedepends=(cmake
             llvm)
arch=(x86_64)
source=(https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('43189460b366ea3126242878c36ee8a403e37ec4baef7e61ccfa124b1414e7a9'
            'SKIP')
validpgpkeys=(949014B23D24354DFD548E5457416A0ADCEF0EFE  # Sergio Martins <sergio.martins@kdab.com>
              C6D862468611FE7CE74E67E2FB13736123B9CB3C) # Alexander Lohnau <alexander.lohnau@kde.org>

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
