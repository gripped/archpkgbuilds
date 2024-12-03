# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.14.0
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL')
makedepends=('git')
depends=('openssl')
source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}")
sha256sums=('771623ec47ad6e30d39b717aa3eb7535720e822aadf1a87ed40794b6a20cecf8')

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
