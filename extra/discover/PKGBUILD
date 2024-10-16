# Maintainer: Antonio Rojas <arojas@archlinux.org> 

pkgname=discover
pkgver=6.2.1
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='KDE and Plasma resources management GUI'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(appstream-qt
         archlinux-appstream-data
         attica
         discount
         gcc-libs
         glib2
         glibc
         kcmutils
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kiconthemes
         kidletime
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knewstuff
         knotifications
         kservice
         kstatusnotifieritem
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         purpose
         qcoro
         qt6-base
         qt6-declarative
         qt6-webview)
makedepends=(extra-cmake-modules
             flatpak
             fwupd
             packagekit-qt6)
optdepends=('flatpak: Flatpak packages support'
            'fwupd: firmware update support'
            'packagekit-qt6: to manage packages from Arch Linux repositories (not recommended, use at your own risk)')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        0001-FwupdBackend-Do-not-use-more-API-now-removed-in-fwupd-2-0-0.patch)
sha256sums=('71ed2df481441ef69e1d5c6f0997f0376d83a8714851c6d014d1164bc8ee6d91'
            'SKIP'
            '85b701bfca5b3944abda1d1b8101d381b16c484773da25848a89f69734248c05')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 < ../0001-FwupdBackend-Do-not-use-more-API-now-removed-in-fwupd-2-0-0.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
