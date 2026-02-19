# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: André Klitzing <aklitzing () gmail () com>

pkgname=clazy
pkgver=1.17
pkgrel=1
pkgdesc='Qt oriented code checker based on clang framework'
url='https://www.kdab.com/'
license=(GPL-2.0-or-later)
depends=(clang
         glibc
         libgcc
         libstdc++
         llvm-libs
         sh)
makedepends=(cmake
             git
             llvm)
arch=(x86_64)
source=(git+https://invent.kde.org/sdk/clazy#tag=v$pkgver)
sha256sums=('2ac346abd30e45bdf19ec66603e73e8fb9046cfac48b383eb66c000e8c7f683d')
validpgpkeys=(949014B23D24354DFD548E5457416A0ADCEF0EFE  # Sergio Martins <sergio.martins@kdab.com>
              C6D862468611FE7CE74E67E2FB13736123B9CB3C) # Alexander Lohnau <alexander.lohnau@kde.org>

build() {
  cmake -B build $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
