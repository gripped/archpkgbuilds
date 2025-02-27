# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-gtk
pkgver=6.3.2
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
sha256sums=('2db1515c463eb2484a4b269b7b82b962aeaee6d7b3b5b22ba4141db3f7b785d2'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build(){
  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
