# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=qtxdg-tools
pkgver=4.5.0
pkgrel=1
pkgdesc="libqtxdg user tools"
arch=("x86_64")
url="https://github.com/lxqt/qtxdg-tools"
license=("LGPL2.1")
depends=("qt6-base" "libqtxdg")
makedepends=("cmake" "qt6-tools" "lxqt-build-tools")
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('4532035802a8b08d5475ed8b054e417366327e85f43dd3c1bf1ab1864e422701'
            'SKIP')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)
conflicts=('libqtxdg<3.9.1')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
