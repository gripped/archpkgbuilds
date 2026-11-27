# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-firewall
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Control Panel for your system firewall'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(glibc
         kauth
         kcmutils
         kconfig
         kcoreaddons
         ki18n
         kirigami
         libstdc++
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             python)
optdepends=('firewalld: firewalld backend'
            'iproute2: netstat backend'
            'python: ufw backend'
            'ufw: ufw backend')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('de78d3c92f8808c7765f072e361037351dc5f9b62f02db8c6f23f06f2d873230'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
