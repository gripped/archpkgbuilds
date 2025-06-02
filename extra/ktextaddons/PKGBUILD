# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ktextaddons
pkgver=1.6.0
pkgrel=1
pkgdesc='Various text handling addons'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://invent.kde.org/libraries/ktextaddons'
depends=(gcc-libs
         glibc
         karchive
         kcolorscheme
         kconfig
         kcoreaddons
         ki18n
         kio
         ktextwidgets
         kwidgetsaddons
         qt6-base
         qt6-speech
         qtkeychain-qt6
         sonnet
         syntax-highlighting)
makedepends=(doxygen
             extra-cmake-modules
             qt6-doc
             qt6-tools)
optdepends=('languagetool: Grammar checking'
            'grammalecte: French grammar checking'
            'libreoffice: Use autocorrection data from LibreOffice')
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('d9846505a52f97bda64ead193032bc29573ec31481f473be3c586f5b8321ecdc'
            'SKIP')
validpgpkeys=(90A774939A973FF1ECC827788FFE4352ED54BB8A) # laurent Montel <montel@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_DESIGNERPLUGIN=ON \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
