# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=breeze
pkgname=(breeze
         breeze5)
pkgver=6.5.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
arch=(x86_64)
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze-icons
         frameworkintegration
         gcc-libs
         glibc
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kdecoration
         kguiaddons
         ki18n
         kiconthemes
         kirigami
         kwidgetsaddons
         kwindowsystem
         qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(extra-cmake-modules
             frameworkintegration5
             kconfigwidgets5
             kiconthemes5
             kirigami2
             kwindowsystem5)
optdepends=('breeze-gtk: Breeze widget style for GTK applications'
            'breeze5: Breeze widget style for Qt5 applications')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/breeze/-/commit/4a8a46ab.patch
        https://invent.kde.org/plasma/breeze/-/commit/2cd5b37d.patch)
sha256sums=('d782875a4510c31435ccd5aad209eb519c0a4ddfdb7da392f54eae863c2e8699'
            'SKIP'
            '317b08e022cd6847b2d5602df39c92e499d997c879a830a7f9293596ee95b9d2'
            'bc0dc7d58f990cf5d5eec7660ec977277abe4f6752a62296b9746fc3911e2da0')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
# Fix menu padding
  patch -d $pkgname-$pkgver -p1 < 4a8a46ab.patch
  patch -d $pkgname-$pkgver -p1 < 2cd5b37d.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build

  cmake -B build5 -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT6=OFF
  cmake --build build5
}

package_breeze() {
  DESTDIR="$pkgdir" cmake --install build
}

package_breeze5() {
  pkgdesc='Qt5 Breeze style'
  depends=(breeze
           breeze-icons
           gcc-libs
           glibc
           frameworkintegration5
           kconfig5
           kconfigwidgets5
           kguiaddons5
           kiconthemes5
           kirigami2
           kwindowsystem5
           qt5-base
           qt5-declarative)
  conflicts=('breeze<5.27.80')
  replaces=('breeze<5.27.80')
  optdepends=()
  groups=()

  DESTDIR="$pkgdir" cmake --install build5
  rm -r "$pkgdir"/usr/share
}
