# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=rtorrent
pkgver=0.10.0
pkgrel=1
pkgdesc='Ncurses BitTorrent client based on libTorrent'
url='https://rakshasa.github.io/rtorrent/'
license=('GPL')
arch=('x86_64')
makedepends=('git')
depends=("libtorrent=0.14.${pkgver##*.}" 'curl' 'xmlrpc-c')
source=("git+https://github.com/rakshasa/rtorrent.git#tag=v${pkgver}")
sha256sums=('9ab79dddd8498d2cc601804b3e3a48dded73c7926e631e64dd0e614875b76205')

prepare() {
  cd ${pkgname}
  git cherry-pick -n 38b39bdafc9edd7e7e72672e6fcbd397b6c2cab8
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  export CXXFLAGS+=' -fno-strict-aliasing'
  ./configure \
  --prefix=/usr \
  --disable-debug \
  --with-xmlrpc-c
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -D doc/rtorrent.rc "${pkgdir}"/usr/share/doc/rtorrent/rtorrent.rc
}
