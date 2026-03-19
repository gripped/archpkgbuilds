# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-configtool
pkgver=5.1.13
pkgrel=1
pkgdesc="Configuration Tool for Fcitx5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-configtool"
license=('GPL-2.0-or-later')
groups=('fcitx5-im')
provides=('fcitx5-config-qt' 'kcm-fcitx5')
conflicts=('kcm-fcitx5')
replaces=('kcm-fcitx5')
depends=('fcitx5' 'fcitx5-qt' 'kdbusaddons' 'kwidgetsaddons' 'kitemviews' 'kwindowsystem')
optdepends=('kcmutils: for KCM support'
            'kdeclarative: for KCM support'
            'kirigami: for KCM support'
            'ksvg: for KCM support'
            'libplasma: for fcitx5-plasma-theme-generator')
makedepends=('git' 'extra-cmake-modules' 'kcmutils' 'kdeclarative' 'kirigami' 'ksvg' 'libplasma'
             'ninja' 'python')
source=("git+https://github.com/fcitx/fcitx5-configtool.git#tag=$pkgver?signed")
sha512sums=('3cd7f4160d1c7db286179582eda199216f6fa7f0583fb605844e11664a9595df41b8d0277b18cf38e39baf7e18a6ec6a19177b18e357a3faa04f5a3581d450a7')
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
    ../$pkgname
  ninja
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
