# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-configtool
pkgver=5.1.5
pkgrel=1
pkgdesc="Configuration Tool for Fcitx5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-configtool"
license=('GPL')
groups=('fcitx5-im')
provides=('fcitx5-config-qt' 'kcm-fcitx5')
conflicts=('kcm-fcitx5')
replaces=('kcm-fcitx5')
depends=('fcitx5' 'fcitx5-qt' 'kdbusaddons' 'kwidgetsaddons' 'kitemviews')
optdepends=('kcmutils: for KCM support'
            'kdeclarative: for KCM support'
            'kirigami: for KCM support'
            'ksvg: for KCM support'
            'libplasma: for fcitx5-plasma-theme-generator')
makedepends=('git' 'extra-cmake-modules' 'kcmutils' 'kdeclarative' 'kirigami' 'ksvg' 'libplasma'
             'ninja' 'python')
source=("git+https://github.com/fcitx/fcitx5-configtool.git#tag=$pkgver?signed")
sha512sums=('e89970484c2588b181e456b6a81ff23156c39d82364ab32aa9069fcb5d3b2df233b117b0742d09ccd6342dc4681908123f2d64b611e5720143a75501e5ee9cb4')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DUSE_QT6=ON \
    ../$pkgname
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
