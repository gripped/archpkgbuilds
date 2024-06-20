# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ocean-sound-theme
pkgdesc='Ocean Sound Theme for Plasma'
pkgver=6.1.0
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(any)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=()
makedepends=(extra-cmake-modules
             qt6-base)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('9ec655c4f3f14f9e6a04450fdb2ca89a7f7b55edb6f17ed36d9af566ebe005f0'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
