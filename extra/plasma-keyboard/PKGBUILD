# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-keyboard
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(x86_64)
pkgdesc='Virtual Keyboard for Qt based desktops'
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(glibc
         kcmutils
         kconfig
         kcoreaddons
         kcrash
         ki18n
         kirigami
         kirigami-addons
         kitemmodels
         libplasma
         libstdc++
         libxkbcommon
         qt6-base
         qt6-declarative
         qt6-virtualkeyboard
         wayland)
makedepends=(extra-cmake-modules
             qt6-wayland
             wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('ec54e6b2d163daf5288cab20ccc7043823dc0e2a3fa431eb2499d7945fa820bb'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
