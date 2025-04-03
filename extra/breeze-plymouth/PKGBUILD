# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-plymouth
pkgver=6.3.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plymouth theme for the Breeze visual style for the Plasma Desktop'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(glibc
         plymouth)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
	 c49e5349df34a74b023c3970bfc84828c57ead52.patch)
sha256sums=('1b73dd447db8049a2b15742870b3499e5b8b4d6f51fb1dd6baa57189bf3a4894'
            'SKIP'
    	    '9142f678c9a60e1015a441abfe9acf3d0d1ec9b4c424a8dca26864f5f2d9912a')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../c49e5349df34a74b023c3970bfc84828c57ead52.patch
}

build(){
  cmake -B build  -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
