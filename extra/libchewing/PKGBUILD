# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: whisky <archlinux.cle(at)gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=libchewing
_pkgver=0.8.4
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
source=("https://github.com/chewing/${pkgname}/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tar.zst"{,.minisig})
sha256sums=('c272e85c9aff03265db08641cac25709b9faf45b4602e04ea6cb39317103b3fa'
            'c0e292e359098050395dc88a809d770be0ff0ee331d71da4f8ec3e19f94f794a')
# The key is mentioned on https://github.com/chewing/libchewing
_validminisignkey='RWRzJFnXiLZleAyCIv1talBjyRewelcy9gzYQq9pd3SKSFBPoy57sf5s'

# XXX: move to verify() when devtools supports it
# https://gitlab.archlinux.org/archlinux/devtools/-/issues/224
prepare() {
  minisign -Vm $pkgname-$_pkgver.tar.zst -P $_validminisignkey
}

build() {
  cd $pkgname-$_pkgver
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
  make -C $pkgname-$_pkgver/build -j1 check
}

package() {
  make -C $pkgname-$_pkgver/build DESTDIR="${pkgdir}" install
}
