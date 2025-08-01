# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-pass
pkgver=1.3.0
pkgrel=1
arch=(x86_64)
pkgdesc='Plasma applet for the Pass password manager'
url='https://www.dvratil.cz/2018/05/plasma-pass/'
license=(GPL-2.0-or-later)
depends=(gcc-libs
         glibc
         gpgmepp
         kcoreaddons
         ki18n
         kirigami
         kitemmodels
         libplasma
         oath-toolkit
         plasma-workspace
         plasma5support
         qgpgme
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('91b32509638ab602073816287110ac79b86ffc7f05c23b3285886f7ce6e4cd0f'
            'SKIP')
validpgpkeys=('0ABDFA55A4E6BEA99A83EA974D69557AECB13683'  # Daniel Vrátil <dvratil@kde.org>
              'D81C0CB38EB725EF6691C385BB463350D6EF31EF') # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
