# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=libqtxdg
pkgver=4.5.0
pkgrel=1
pkgdesc="Library providing freedesktop.org XDG specs implementations for Qt"
arch=("x86_64")
url="https://github.com/lxqt/$pkgname"
license=("LGPL-2.1-or-later" "LGPL-2.1-only WITH Qt-LGPL-exception-1.1")
depends=("qt6-base" "qt6-svg")
makedepends=("cmake" "git" "lxqt-build-tools")
checkdepends=("xorg-server-xvfb")
optdepends=(
  'xterm: the default terminal for running .desktop files'
)
provides=("libQt6Xdg.so" "libQt6XdgIconLoader.so")
source=("git+https://github.com/lxqt/$pkgname.git#tag=$pkgver?signed")
sha256sums=('d03dbe1a2e99c311161cfb6511cec03d3dd3898b58db3c4fb32b52e8bfb745ac')
validpgpkeys=(
  "169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
  "7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON
  make
}

check() {
  cd build

  xvfb-run --auto-display make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname"/{AUTHORS,COPYING,Digia-Qt-LGPL-Exception-1.1} \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}
