# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin
pkgver=24.02.0
pkgrel=3
pkgdesc='KDE File Manager'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL-2.0-or-later)
depends=(baloo
         baloo-widgets
         gcc-libs
         glibc
         kbookmarks
         kcmutils
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kiconthemes
         kio
         kio-extras
         kjobwidgets
         knewstuff
         knotifications
         kparts
         kservice
         ktextwidgets
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         phonon-qt6
         plasma-activities
         qt6-base
         solid)
makedepends=(extra-cmake-modules
             kdoctools)
optdepends=('ffmpegthumbs: video thumbnails'
            'kde-cli-tools: for editing file type options'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'kio-admin: for managing files as administrator' 
            'konsole: terminal panel'
            'kio-admin: for managing files as administrator'
            'purpose: share context menu')
groups=(kde-applications
        kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/system/dolphin/-/commit/95551f44.patch
        https://invent.kde.org/system/dolphin/-/commit/1258bb94.patch)
sha256sums=('10ef284597e28f933d8b4ead75d02759a15df4bcc928ed10b54f8065b7431257'
            'SKIP'
            '6e56ba2c4e5379742fe2fb839b10a2d01f43101634e063966ac2e0f5fd134e9e'
            '7674c47fd56e78829562559a13defeb51d847b5c400b8b1d454d1ee7639e262b')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 95551f44.patch # Fix docks disappearing on minimize
  patch -d $pkgname-$pkgver -p1 < 1258bb94.patch # Fix crash with Qt 6.7
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
