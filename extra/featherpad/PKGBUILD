# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Peter Mattern <pmattern at arcor dot de>

pkgname=featherpad
pkgver=1.6.3
pkgrel=1
pkgdesc='Lightweight Qt plain text editor'
arch=('x86_64')
url='https://github.com/tsujan/FeatherPad'
license=('GPL3')
depends=('hicolor-icon-theme' 'hunspell' 'qt6-svg')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
source=("git+https://github.com/tsujan/FeatherPad.git#tag=V${pkgver}?signed")
sha256sums=('5252d69c3805752b2e8e05f9aaeeea4b31fdd808f5025accb8c5ded9027be5f5')
validpgpkeys=('19DFDF3A579BD509DBB572D8BE793007AD22DF7E')

build() {
  cmake -B build -S FeatherPad \
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
