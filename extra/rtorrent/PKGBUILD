# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent
pkgver=0.16.6
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent'
url='https://rakshasa.github.io/rtorrent/'
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=('git')
depends=("libtorrent=${pkgver}" 'curl' 'tinyxml2')
source=("git+https://github.com/rakshasa/rtorrent.git#tag=v${pkgver}")
sha256sums=('998397916576bfaa37ddbe1c4cc261c01dd0fb7ee341e6ec26d00891f708f829')

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure \
  --prefix=/usr \
  --disable-debug \
  --with-xmlrpc-tinyxml2
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -D doc/rtorrent.rc "${pkgdir}"/usr/share/doc/rtorrent/rtorrent.rc
}
