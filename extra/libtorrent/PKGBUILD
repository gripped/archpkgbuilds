# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.15.2
_commit=215547d9e361f9932752af54fb9cf66dc3cd6ced
pkgrel=2
pkgdesc='BitTorrent library with a focus on high performance and good code'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('git')
depends=('openssl')
#source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}")
source=("git+https://github.com/rakshasa/libtorrent.git#commit=${_commit}")
sha256sums=('fc9dda567236408f104d9dd29032a5e3ff5f4d94dcc2abf526fa68b858fe9b85')

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure \
  --prefix=/usr \
  --disable-debug
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
