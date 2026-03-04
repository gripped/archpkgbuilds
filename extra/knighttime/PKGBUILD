# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=knighttime
pkgver=6.6.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Helpers for scheduling the dark-light cycle'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcoreaddons
         kdbusaddons
         kholidays
         qt6-base
         qt6-positioning)
makedepends=(extra-cmake-modules
             ki18n
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('a5df4af8cc7bddb96e43d74ddca5d75c45a249a493c476c98e5bba3aca310e1c'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
