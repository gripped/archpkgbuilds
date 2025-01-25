# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kommit
pkgver=1.7.1
pkgrel=2
pkgdesc='Git gui client'
arch=(x86_64)
url='https://apps.kde.org/kommit'
license=(GPL-3.0-only)
depends=(gcc-libs
         glibc
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kio
         kparts
         kwidgetsaddons
         kxmlgui
         libgit2
         openssl
         qt6-base
         qt6-charts
         sh
         syntax-highlighting)
makedepends=(extra-cmake-modules
             dolphin
             git
             kdoctools
             ktexteditor)
source=(git+https://invent.kde.org/sdk/kommit#tag=v$pkgver)
sha256sums=('c2c117c790973d2f1314269ed4187ad8ce48d89cca48d2e31ca37eba0c5b6a8b')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D') # Jonathan Esk-Riddell <jr@jriddell.org>

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=None \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
