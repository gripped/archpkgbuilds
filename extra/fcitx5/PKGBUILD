# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5
pkgver=5.1.2
pkgrel=1
pkgdesc="Next generation of fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5"
license=('GPL')
conflicts=('fcitx')
groups=('fcitx5-im')
depends=('cairo' 'enchant' 'iso-codes' 'libgl' 'libxkbcommon-x11' 'pango' 'systemd' 'wayland'
         'xcb-imdkit' 'xcb-util-wm' 'libxkbfile' 'gdk-pixbuf2')
makedepends=('extra-cmake-modules' 'ninja' 'wayland-protocols' 'fmt')
source=("https://download.fcitx-im.org/fcitx5/fcitx5/fcitx5-${pkgver}_dict.tar.xz"{,.sig})
sha512sums=('dfe546dbb5a777239b8f221fe7a04638f0272df86f6ec9cfba6a5328e36c2b60890613807e52ef1bda487e3daaba7ac47ed5b81a293d494db0f3f0bab4c231c3'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib .
  ninja
}

check() {
  cd $pkgname-$pkgver
  ninja test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
