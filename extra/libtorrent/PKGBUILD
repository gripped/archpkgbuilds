# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libtorrent
pkgver=0.15.2
pkgrel=1
pkgdesc='BitTorrent library with a focus on high performance and good code'
url='https://rakshasa.github.io/rtorrent/'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('git')
depends=('openssl')
source=("git+https://github.com/rakshasa/libtorrent.git#tag=v${pkgver}"
        "fix-build.patch")
sha256sums=('44718dd21427a6000a10e2ba7052e41f37da46bcc10bbd0ff8731419a71c5ddf'
            'ddcea9a8ee76068aabc896e867a89c4d98b4cae99455ad0343ab7c0f3c935b4d')

prepare() {
  cd ${pkgname}
  patch -Np1 < ../fix-build.patch
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
