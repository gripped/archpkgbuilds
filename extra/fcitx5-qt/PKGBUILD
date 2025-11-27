# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-qt
pkgver=5.1.11
pkgrel=3
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-qt"
license=('LGPL-2.1-or-later AND BSD-3-Clause')
groups=('fcitx5-im')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'fcitx5' 'qt6-base' 'wayland')
makedepends=('git' 'extra-cmake-modules' 'qt5-base' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-qt.git#tag=$pkgver?signed")
sha512sums=('439a90305c0c101722ecb7f26968eb2ad1578ff5d81875151f8a8040a51200f1c24dd89d98386523eacc35f096bfb7557f28b7394cb7016607d08aabc403a702')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname
  cmake . -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib
  ninja
}

check() {
  cd $pkgname
  ninja test
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
