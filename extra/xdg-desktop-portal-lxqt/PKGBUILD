# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Modified from extra/xdg-desktop-portal-kde; original contributors:
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=xdg-desktop-portal-lxqt
pkgver=1.5.0
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KDE Frameworks/libfm-qt'
arch=(x86_64)
groups=(lxqt)
url='https://github.com/lxqt/xdg-desktop-portal-lxqt'
# https://github.com/lxqt/xdg-desktop-portal-lxqt/blob/1.0.2/LICENSE
# All C/C++ files include "any later"
license=('LGPL-2.1-or-later')
depends=(qt6-base kwindowsystem xdg-desktop-portal libfm-qt)
makedepends=(cmake lxqt-build-tools)
provides=(xdg-desktop-portal-impl)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('ce8c222e0849ad581d86f22609f37ac0cd391443313807bf9a2e0b3b894e971f'
            'SKIP')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
