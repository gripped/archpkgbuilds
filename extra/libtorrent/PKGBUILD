# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.15.5
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL-2.0-or-later')
makedepends=('git')
depends=('openssl')
source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}")
sha256sums=('3826cd93010467f310a269c04331ce57a60730db624617a4b72f94fb4d6eb459')

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
