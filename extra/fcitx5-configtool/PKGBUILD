# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-configtool
pkgver=5.1.10
pkgrel=1
pkgdesc="Configuration Tool for Fcitx5"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-configtool"
license=('GPL')
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
sha512sums=('b7bd61a330968cc22e97f58bc417c89a17475e80388d56bc97598e34cf71794ac51747baf20dcbaa07bf12d3e83ff65a42fdf3f3909b34c19e4526f4b18c2e38')
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
