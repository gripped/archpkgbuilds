# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-bamboo
pkgver=1.0.10
pkgrel=1
pkgdesc="Bamboo (Vietnamese Input Method) engine support for Fcitx"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-bamboo"
license=('LGPL-2.1-or-later')
depends=('fcitx5')
makedepends=('git' 'extra-cmake-modules' 'go')
source=("git+https://github.com/fcitx/fcitx5-bamboo.git#tag=$pkgver?signed"
        "git+https://github.com/BambooEngine/bamboo-core.git")
sha512sums=('ee19df1c13379f82337f50935e59b836f5d7af6829d30561c0ce25e210690e33ebb856ebb4fda7a1bce89b5b192b2fe0825c2102867a36924fea94176fad9817'
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
