# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>

pkgname=lxqt-wayland-session
pkgver=0.2.0
pkgrel=1
pkgdesc='Files needed for the LXQt Wayland Session'
arch=('any')
url='https://github.com/lxqt/lxqt-wayland-session'
# see https://github.com/lxqt/lxqt-wayland-session/blob/master/LICENSE for more details
license=(
  'LGPL-2.1-only'       # most files
  'MIT'                 # files adapted from sway and wayfire
  'GPL-2.0-only'        # files adapted from labwc https://github.com/labwc/labwc/blob/0.8.0/meson.build#L5
  'GPL-3.0-only'        # files adapted from river (https://codeberg.org/river/river/src/tag/v0.3.5#licensing) and labwc-themes
  'GPL-3.0-or-later'    # files adopted from niri (https://github.com/YaLTeR/niri/blob/v0.1.9/Cargo.toml#L8)
  'BSD-3-Clause'        # files adapted from hyprland
  'CC-BY-SA-4.0'        # wallpapers
)
depends=(
  'sh'
  'lxqt-session'
  # Allow to use xdg-utils under LXQt, similar to https://github.com/lxqt/lxqt-session/blob/2.0.0/CHANGELOG#L27
  # startlxqtwayland sets XDG_CURRENT_DESKTOP
  'qtxdg-tools'
  # For applications that need layer-shell-qt (ex: lxqt-panel)
  'layer-shell-qt'
)
optdepends=(
  # See upstream README.md for supported compositors
  # Dependencies that are not official packages are commented out
  'labwc'
  # 'wayfire'
  'kwin'
  'hyprland'
  'niri'
  'river'
  'sway'
)
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools')
source=("git+https://github.com/lxqt/$pkgname.git?signed#tag=$pkgver")
sha256sums=('59ff0b36ed4f07fdad2f5450c64bb15ad777c0de45b48911b6dc233d9f043efc')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # https://github.com/tsujan
)

build() {
  cmake -B build -S "$srcdir/$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install

  install -Dm644 $pkgname/{COPYING.LESSER,COPYING,LICENSE.MIT,LICENSE.GPLv2,LICENSE.BSD} -t "$pkgdir"/usr/share/licenses/$pkgname
}
