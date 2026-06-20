# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-lua
pkgver=5.0.17
pkgrel=1
pkgdesc="Lua support for Fcitx 5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-lua"
license=('LGPL-2.1-or-later')
depends=('fcitx5' 'lua')
makedepends=('git' 'extra-cmake-modules' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-lua.git#tag=$pkgver?signed")
sha512sums=('17a8382f40a37ceb3f8e04740c81827fbd67fbf7c848925e3b8e52a79e22d66d5df298fb8cf6bd9fbaeefafb133edcc6eec6abf3651d9612cd811ca681eed8db')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
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
