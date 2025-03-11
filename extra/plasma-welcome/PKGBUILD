# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-welcome
pkgver=6.3.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='A friendly onboarding wizard for Plasma'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knewstuff # org.kde.knewstuff-dialog
         kservice
         ksvg
         kuserfeedback
         kwindowsystem
         libplasma
         plasma-nm
         plasma5support
         qt6-5compat
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('fc3418eecc6e50976b2aec881a26c7db3c149f364c9f3f2998d2e4b5d63f0fa4'
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
