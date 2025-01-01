# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.15.1
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('git')
depends=('openssl')
source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}")
sha256sums=('8a8395a8a7042f4b3ec5b1b08f02cc44921bd1b10296f9cc5e7f17209d686cde')

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  export CXXFLAGS+=' -fno-strict-aliasing'
  ./configure \
  --prefix=/usr \
  --disable-debug
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
