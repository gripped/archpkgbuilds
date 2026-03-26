# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-qt
pkgver=5.1.13
pkgrel=3
pkgdesc="Fcitx5 Qt Library (Qt5 & Qt6 integrations)"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-qt"
license=('LGPL-2.1-or-later AND BSD-3-Clause')
groups=('fcitx5-im')
depends=('glibc' 'libgcc' 'libstdc++' 'libxcb' 'libxkbcommon' 'fcitx5' 'qt6-base' 'wayland')
makedepends=('git' 'extra-cmake-modules' 'qt5-base' 'ninja')
source=("git+https://github.com/fcitx/fcitx5-qt.git#tag=$pkgver?signed")
sha512sums=('1bfccc4e6ed808aee6f7e89b07c4f7354d5751e3fb6ae8b8ccac829394f3d9259a0780505821f2bee60a7a679fb5014926527cf8517aa9945a6356fd48dbc6aa')
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
