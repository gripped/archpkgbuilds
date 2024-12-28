# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=kvirc
pkgver=5.2.6
pkgrel=2
pkgdesc='Qt based IRC client'
arch=('x86_64')
url='http://kvirc.net/'
license=('GPL2')
depends=('enchant' 'hicolor-icon-theme' 'qt6-multimedia' 'qt6-svg' 'qt6-webengine' 'qt6-5compat')
makedepends=('cmake' 'ninja' 'python')
optdepends=('perl: scripting support'
            'python: scripting support')
source=("https://github.com/kvirc/KVIrc/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'kvirc.appdata.xml')
sha256sums=('e8de989b5df8d9286da3e26146682a349fe496864dc2e7d7eae8dc27167fdd25'
            '433c6b2d36479ae2c4a0342dc9750ba79ffd9f4fa479f28740cd1c4303bc71da')

build() {
  cmake -S KVIrc-$pkgver -B build -G Ninja -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH=YES \
    -DWANT_KDE=OFF \
    -DWANT_PHONON=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname.appdata.xml "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
}
