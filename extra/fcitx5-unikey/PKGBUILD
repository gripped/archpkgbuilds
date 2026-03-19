# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-unikey
pkgver=5.1.10
pkgrel=1
pkgdesc="Unikey engine support for Fcitx5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-unikey"
license=('GPL-2.0-or-later')
depends=('fcitx5-qt')
makedepends=('git' 'extra-cmake-modules' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-unikey.git#tag=$pkgver?signed")
sha512sums=('ad748204ec83458f52dc91eff3af2b6a6bf208eab380ce47ec34c45f05694c71bbc9e11f762fa1df9d7b6f2b134c839f6ed945aea12849a157ceb6aa596d56eb')
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
