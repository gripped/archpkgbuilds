# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-unikey
pkgver=5.1.11
pkgrel=1
pkgdesc="Unikey engine support for Fcitx5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-unikey"
license=('GPL-2.0-or-later')
depends=('fcitx5-qt')
makedepends=('git' 'extra-cmake-modules' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-unikey.git#tag=$pkgver?signed")
sha512sums=('60bc0ceccb5b276a44f32e90e31f90833b1e22eb3c3941fe4bed600cd07f0d1ae53f04d8e3ef5c27c13be46bebecce8ee61e35931bb1df403ba6842f46233ac3')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build() {
  cd $pkgname
  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
