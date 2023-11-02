# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-qt
pkgver=5.1.2
pkgrel=1
pkgdesc="Fcitx5 Qt Library"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-qt"
license=('GPL')
groups=('fcitx5-im')
depends=('fcitx5' 'qt5-base')
makedepends=('extra-cmake-modules' 'ninja' 'qt6-base' 'qt6-wayland')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha512sums=('0d39c8b659ec49e6d279b777cd2aafe1b8f902e4380a644449c0552911c5297045d85f2edcb8823c946b66771d1b3d0e0a3826dbf4c6fc626c77807dbb8c39f4'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

build(){
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DENABLE_QT4=0 -DENABLE_QT6=1 .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
