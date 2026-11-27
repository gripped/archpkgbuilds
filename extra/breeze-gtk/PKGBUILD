# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-gtk
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Breeze widget theme for GTK 2 and 3'
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=()
makedepends=(breeze
             extra-cmake-modules
             python-cairo
             sassc)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('9b96db2c0dd1a6ca018f9bb1cea4ed0947f140cd30f2106d9652448202e47c50'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '58743C0A93487794BC44ECE873C3D7758E7A544A'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build(){
  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
