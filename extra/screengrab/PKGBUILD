# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Beej <beej@beej.us>

pkgname=screengrab
pkgver=3.3.0
pkgrel=1
pkgdesc="Crossplatform tool for grabbing screenshots of your desktop."
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/screengrab"
license=("GPL2")
depends=("qt6-base" "kwindowsystem" "libqtxdg" "libx11" "libxcb" "libQt6Xdg.so" "layer-shell-qt")
makedepends=("cmake" "qt6-tools" "lxqt-build-tools")
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha256sums=('46f551f5297dae9507a0c5cab159d073972e680521a03edb0ee959c6c22806e8'
            'SKIP')
validpgpkeys=(
  '7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3'  # Alf Gaida <agaida@siduction.org>
  '19DFDF3A579BD509DBB572D8BE793007AD22DF7E'  # Pedram Pourang <tsujan2000@gmail.com>
  '48836EB124A1EAAE695EDFEA229CA0A00A17D258'  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
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
