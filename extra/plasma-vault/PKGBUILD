# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-vault
pkgver=6.8.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma applet and services for creating encrypted vaults'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(fuse3
         glibc
         gocryptfs
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kitemmodels
         kservice
         kwidgetsaddons
         libgcc
         libksysguard
         libplasma
         libstdc++
         networkmanager-qt
         plasma-activities
         plasma-workspace
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
optdepends=('cryfs: to open old vaults created with CryFS'
            'encfs: to open old vaults created with EncFS')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('fce26884a57ab2e0f6a6df4a70d5a7642bb47a3787ea6ac9d66143c9fb851362'
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
