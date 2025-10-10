# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-qt
pkgver=5.1.10
pkgrel=4
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'fcitx5' 'qt6-base' 'wayland')
makedepends=('git' 'extra-cmake-modules' 'qt5-base' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-qt.git#tag=$pkgver?signed"
         qt-6.10.patch)
sha512sums=('2e4e50f4820e33d2c9849b498991ec492cb571a673a1c276634d86b9145ee0e3058c5d2849615c6ace0a0b68fc25c242eed7e57a27a9d36b1ee0f83263c04bf3'
            '4793626852e53c599eab694f7e859b54eb7804f2f8515505b5ef7c543510eeb80f14baf256ef66a27898568303218503de583f734d9a8408d67df3d7235e6999')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  cd $pkgname
  patch -p1 -i ../qt-6.10.patch
}

build() {
  cd $pkgname
  cmake . -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib
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
