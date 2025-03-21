# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent
pkgver=0.15.1
pkgrel=4
pkgdesc='Ncurses BitTorrent client based on libTorrent'
url='https://rakshasa.github.io/rtorrent/'
license=('GPL-2.0-only')
arch=('x86_64')
makedepends=('git')
depends=("libtorrent=0.15.${pkgver##*.}" 'curl' 'tinyxml2')
source=("git+https://github.com/rakshasa/rtorrent.git#tag=v${pkgver}")
sha256sums=('6d09484a12dc8699749daf29e2461990e0a1134e41e741e90aca39ed720cad3f')

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  export CXXFLAGS+=' -fno-strict-aliasing'
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
