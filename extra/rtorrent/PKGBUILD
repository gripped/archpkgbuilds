# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent
pkgver=0.15.2
_commit=2ab7460cbca4a0e8d5c33e71610de2e620eecc8c
pkgrel=2
pkgdesc='Ncurses BitTorrent client based on libTorrent'
url='https://rakshasa.github.io/rtorrent/'
license=('GPL-2.0-only')
arch=('x86_64')
makedepends=('git')
depends=("libtorrent=${pkgver}" 'curl' 'tinyxml2')
#source=("git+https://github.com/rakshasa/rtorrent.git#tag=v${pkgver}")
source=("git+https://github.com/rakshasa/rtorrent.git#commit=${_commit}")
sha256sums=('b464e955b864c39fef1514a16f94fb84e0ba26a6cb638af8dce027284d2ef01d')

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
