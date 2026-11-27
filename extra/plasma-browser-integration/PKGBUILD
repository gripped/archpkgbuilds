# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-browser-integration
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Components necessary to integrate browsers into the Plasma Desktop'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(glibc
         plasma-activities
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         ki18n
         kio
         kjobwidgets
         kservice
         kstatusnotifieritem
         libstdc++
         plasma-workspace
         purpose
         qt6-base)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('4d5e3aaa7caaa4b82d2c95192e84af4d5f80ba62d0b23414317108f85b1e35ad'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() { 
  cmake -B build  -S $pkgname-$pkgver \
    -DINSTALL_CHROME_MANIFEST=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
