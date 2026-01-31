# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=libchewing
_pkgver=0.11.0
pkgver=${_pkgver/-rc./rc}
pkgrel=1
pkgdesc='Intelligent Chinese phonetic input method'
url='https://chewing.im/'
arch=('x86_64')
# See discussions at https://github.com/chewing/libchewing/issues/433
license=('LGPL-2.1-or-later')
depends=('sqlite')
makedepends=('cmake' 'minisign' 'rust' 'corrosion')
optdepends=(
  'chewing-editor: view and modify libchewing user phrases database'
)
source=("https://github.com/chewing/libchewing/releases/download/v${_pkgver}/libchewing-${_pkgver}.tar.zst"{,.minisig})
sha256sums=('b2dc134f994db524d735c014c7ff41285ab439c3f7a437bb5f0e446a63b7220d'
            '5eb480f77e63588e97de1e1a30541367a5bea10e1e4cdf1c8a5256319e84d4df')
# The key is mentioned on https://github.com/chewing/libchewing
_validminisignkey='RWRzJFnXiLZleAyCIv1talBjyRewelcy9gzYQq9pd3SKSFBPoy57sf5s'

# XXX: move to verify() when devtools supports it
# https://gitlab.archlinux.org/archlinux/devtools/-/issues/224
prepare() {
  minisign -Vm libchewing-$_pkgver.tar.zst -P $_validminisignkey
}

build() {
  cd libchewing-$_pkgver
  # Specify the existence of ncurses.h manually as FindCurses.cmake cannot identify it
  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_INFO=ON \
    -DCURSES_HAVE_NCURSES_H=ON
  make -C build
}

check() {
  # parallel testing is broken (https://github.com/chewing/libchewing/issues/293)
  make -C libchewing-$_pkgver/build -j1 check
}

package() {
  make -C libchewing-$_pkgver/build DESTDIR="${pkgdir}" install
}
