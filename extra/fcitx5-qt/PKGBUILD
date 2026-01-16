# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-qt
pkgver=5.1.12
pkgrel=1
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-qt"
license=('LGPL-2.1-or-later AND BSD-3-Clause')
groups=('fcitx5-im')
depends=('glibc' 'gcc-libs' 'libxcb' 'libxkbcommon' 'fcitx5' 'qt6-base' 'wayland')
makedepends=('git' 'extra-cmake-modules' 'qt5-base' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-qt.git#tag=$pkgver?signed")
sha512sums=('1a0238bb44281ea9e10d1c324942214acf4806e9e1fbc671b9825b33ef1710189b59e3967b6f2491689f1c19c9b5f705c02e4ba63e49181456d12af48bd21738')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

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
  install -Dm644 LICENSES/BSD-3-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
