# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-lua
pkgver=5.0.16
pkgrel=2
pkgdesc="Lua support for Fcitx 5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-lua"
license=('LGPL-2.1-or-later')
depends=('fcitx5' 'lua')
makedepends=('git' 'extra-cmake-modules' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-lua.git#tag=$pkgver?signed")
sha512sums=('4eb517abad3c0f0d17cb11873d54e6801f2d802900d4c8d7f28e223a3ba767a7785dc7f0d1c885377a6c94312d70faf9555ab1d52623c94b58b59068490dc260')
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
