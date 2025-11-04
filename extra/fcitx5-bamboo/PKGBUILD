# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-bamboo
pkgver=1.0.9
pkgrel=1
pkgdesc="Bamboo (Vietnamese Input Method) engine support for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-bamboo"
license=('GPL')
depends=('fcitx5')
makedepends=('git' 'extra-cmake-modules' 'go')
source=("git+https://github.com/fcitx/fcitx5-bamboo.git#tag=$pkgver?signed"
        "git+https://github.com/BambooEngine/bamboo-core.git")
sha512sums=('4b42ba56dca897e5c49595e4435ca1573a6ea61d3ec6b52ff06331d233a3d935fb2718b5854c638743dc28f92a99bd017b7244e1d92e8627ae62963579563d66'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  cd fcitx5-bamboo
  git submodule init
  git config submodule.bamboo/bamboo-core.url "$srcdir"/bamboo-core
  git -c protocol.file.allow=always submodule update
}

build(){
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
