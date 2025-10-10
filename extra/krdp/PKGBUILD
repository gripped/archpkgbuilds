# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=krdp
pkgver=6.4.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Library and examples for creating an RDP server'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(freerdp
         gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kcrash
         ki18n
         kirigami
         kpipewire
         kstatusnotifieritem
         libxkbcommon
         qt6-base
         qt6-declarative
         qtkeychain-qt6
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('381c2c025db6b62d2d71655582c4c9272ae04d4225aea5f8a0307619bf990a45'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
