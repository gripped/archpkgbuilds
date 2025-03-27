# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: xyzzy <628208@gmail.com>

pkgname=flameshot
pkgver=12.1.0
pkgrel=6
pkgdesc="Powerful yet simple to use screenshot software"
arch=('x86_64')
url="https://github.com/flameshot-org/flameshot"
license=('GPL-3.0-or-later')
depends=('qt5-svg' 'hicolor-icon-theme' 'kguiaddons5')
makedepends=('qt5-tools' 'cmake')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
    'grim: for wlroots wayland support'
    'xdg-desktop-portal: for wayland support, you will need the implementation for your wayland desktop environment'
    'qt5-imageformats: for additional export image formats (e.g. tiff, webp, and more)'
)
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c82c05d554e7a6d810aca8417ca12b21e4f74864455ab4ac94602668f85ac22a')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_WAYLAND_CLIPBOARD=1 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
