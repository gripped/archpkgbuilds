# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Beej <beej@beej.us>

pkgname=screengrab
pkgver=2.10.0
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/screengrab"
license=("GPL2")
depends=("qt6-base" "kwindowsystem" "libqtxdg" "libx11" "libxcb" "libQt6Xdg.so")
makedepends=("cmake" "qt6-tools")
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha256sums=('c98de5d4b8b0dac7924855315efaa9183cf637ef553bdcd1a3c64526b4c37e04'
            'SKIP')
validpgpkeys=(
  '7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3'  # Alf Gaida <agaida@siduction.org>
  '19DFDF3A579BD509DBB572D8BE793007AD22DF7E'  # Pedram Pourang <tsujan2000@gmail.com>
)

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
