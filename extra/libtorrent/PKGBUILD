# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.16.21
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('openssl')
source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}")
sha256sums=('6bb0182c1a18fc1f05f581ad149edeeff357b8b404b7eb0d9bb3359ddb2df48d')

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
