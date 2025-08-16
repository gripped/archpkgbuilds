# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=libchewing
_pkgver=0.10.2
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
sha256sums=('f2c23a3bb8bc01a9a43eaa190c62ab0f00e7591e8f28bc97ce916e01e3779116'
            'f618a47d0dc872f4a958c0ae36972ee608dbdbe26d673a9fa61df568a40bcb89')
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
