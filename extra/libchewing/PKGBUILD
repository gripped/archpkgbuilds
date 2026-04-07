# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=libchewing
_pkgver=0.12.0
pkgver=${_pkgver/-rc./rc}
pkgrel=1
pkgdesc='Intelligent Chinese phonetic input method'
url='https://chewing.im/'
arch=('x86_64')
# See discussions at https://github.com/chewing/libchewing/issues/433
license=('LGPL-2.1-or-later')
depends=('sqlite')
makedepends=('cmake' 'rust' 'corrosion')
optdepends=(
  'chewing-editor: view and modify libchewing user phrases database'
)
source=("https://codeberg.org/chewing/libchewing/releases/download/v${_pkgver}/libchewing-${_pkgver}.tar.zst"{,.asc})
sha256sums=('6a7fae4aaa6e6ce2bd9f70f0016c553585ed5aca1e086476749a03ac5c3f4cb0'
            'SKIP')
# The key is mentioned on https://codeberg.org/chewing/libchewing
validpgpkeys=(
  '083B3CAB64267E5BAB7159673EF0C673DADCC30C' # Libchewing Signing Key
)


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
