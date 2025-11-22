# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent
pkgver=0.16.3
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent'
url='https://rakshasa.github.io/rtorrent/'
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=('git')
depends=("libtorrent=${pkgver}" 'curl' 'tinyxml2')
source=("git+https://github.com/rakshasa/rtorrent.git#tag=v${pkgver}")
sha256sums=('74c9e53bc551b3729c8dc6a0e3b29d9bbed85bf8f815d2c79693d79fac5335eb')

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
