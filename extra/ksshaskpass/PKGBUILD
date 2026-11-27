# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=ksshaskpass
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='ssh-add helper that uses kwallet and kpassworddialog'
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
arch=(x86_64)
depends=(glibc
         kconfig
         kcoreaddons
         ki18n
         kwidgetsaddons
         libstdc++
         qt6-base
         qtkeychain-qt6)
makedepends=(extra-cmake-modules
             kdoctools)
provides=(x11-ssh-askpass)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
install=$pkgname.install
sha256sums=('93acd43cc199d26714f770e5e0ce0833aee1db9ed009a3d1e96fdd0eea3e3128'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
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
