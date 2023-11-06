# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-menu-data
pkgver=1.4.0
pkgrel=2
pkgdesc='LXQt menu files'
arch=(any)
url='https://github.com/lxqt/lxqt-menu-data'
license=('GPL' 'LGPL')
makedepends=(cmake lxqt-build-tools qt5-tools)
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha512sums=('6977c7c008537dd205414f9444fe3014bb8ba68059d81e0f15eede963d91c44d177f268c28042e57c432cde5ecbd2b7d9bc9462ba7414ce92919e5507fc4b5e3'
            'SKIP')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
