# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-configtool
pkgver=5.1.14
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
sha512sums=('831ea450f4e49cce111b12629f9dab31096e5c7f5f4a188eccbb8dcdf3e45d0f1c212915c04a3c13fe1979742e1832715988914347e70d05a512411d0fdfcdd5')
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
