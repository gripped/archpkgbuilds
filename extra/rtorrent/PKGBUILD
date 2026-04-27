# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent
pkgver=0.16.10
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent'
url='https://rakshasa.github.io/rtorrent/'
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=('git')
depends=("libtorrent=${pkgver}" 'curl' 'tinyxml2')
source=("git+https://github.com/rakshasa/rtorrent.git#tag=v${pkgver}")
sha256sums=('5b8883a60f0ffc0b25ff7c1af59a1d2f6db9e64c3439f8c436528b0f5ba7ea13')

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
