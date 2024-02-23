# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.3.0
pkgrel=1
pkgdesc='Implementation of IETF QUIC protocol'
url='https://github.com/ngtcp2/ngtcp2'
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('brotli')
provides=('libngtcp2.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b566a7574a6c58bb19ec5b916300141283ef05139768de2b021ff37676b63dff')
b2sums=('37af4705ae5e7dbf45c11fd03bf2f975ed37aee134456cf69f2b738627e31b578b1856ffc36eaad30c812e20accc277535fb1d0b8533ee22ee0067e19c10dc74')

prepare() {
  cd ngtcp2-${pkgver}
  autoreconf -i
}

build() {
  cd ngtcp2-${pkgver}
  # add --with-openssl after quic was released in openssl mainline
  ./configure \
    --prefix=/usr \
    --with-libbrotlienc \
    --with-libbrotlidec
  make
}

package() {
  cd ngtcp2-${pkgver}/lib
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
