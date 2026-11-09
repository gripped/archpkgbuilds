# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Forked from extra/libdbusmenu-qt. Original contributors:
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libdbusmenu-lxqt
pkgver=0.5.0
pkgrel=1
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=(x86_64)
url='https://github.com/lxqt/libdbusmenu-lxqt'
# https://github.com/lxqt/libdbusmenu-lxqt/blob/master/COPYING
# All source files contain "any later"
license=('LGPL-2.0-or-later')
depends=(qt6-base)
makedepends=(cmake doxygen git lxqt-build-tools)
checkdepends=(dbus xorg-server-xvfb)
source=("git+https://github.com/lxqt/libdbusmenu-lxqt?signed#tag=$pkgver")
sha256sums=('1f4c8d1f9355b60acba4006c5d5ffcda91a181f0db703b736b8bfe9e263b379e')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # https://github.com/tsujan
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
  cmake -B build -S libdbusmenu-lxqt \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  dbus-launch xvfb-run --auto-display cmake --build build --target check
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
