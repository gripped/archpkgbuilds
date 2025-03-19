# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=1.6.1
pkgrel=1
pkgdesc='Lightweight Qt plain text editor'
arch=('x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt6-svg')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("https://github.com/tsujan/FeatherPad/releases/download/V$pkgver/FeatherPad-$pkgver.tar.xz"{,.asc})
sha256sums=('fb2515f65b607cd659e67eb20bb348d81357bd3471ad4f6e887fa0c49be509ad'
            'SKIP')
validpgpkeys=('19DFDF3A579BD509DBB572D8BE793007AD22DF7E')

build() {
  cmake -B build -S FeatherPad-$pkgver \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=None \
        -DENABLE_QT5=OFF \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
