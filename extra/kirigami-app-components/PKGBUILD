# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kirigami-app-components
pkgver=1.1.0
pkgrel=1
pkgdesc='Kirigami addons and modules necessary to do a full featured KDE application'
url='https://invent.kde.org/libraries/kirigami-app-components'
arch=(x86_64)
license=(GPL-2.0-or-later
         LGPL-2.1-or-later)
depends=(glibc
         kconfig
         kcoreaddons
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         libstdc++
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('f83f92ecfab89fa8b75867c47c291f1619e1a3970afc30437b3374aa75f6530f'
            'SKIP')
validpgpkeys=(1FA881591C26B276D7A5518EEAAF29B42A678C20) # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
