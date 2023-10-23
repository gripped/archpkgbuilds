# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.0.1
pkgrel=1
pkgdesc='Implementation of IETF QUIC protocol'
url='https://github.com/ngtcp2/ngtcp2'
arch=('x86_64')
license=('MIT')
provides=('libngtcp2.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9db25678ac5288faf1d4e39b4e28a68b73b49068c5444b542a96a06362f1b778')

prepare() {
  cd ngtcp2-${pkgver}
  autoreconf -i
}

build() {
  cd ngtcp2-${pkgver}
  # add --with-openssl after quic was released in openssl mainline
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd ngtcp2-${pkgver}
  make check
}

package() {
  cd ngtcp2-${pkgver}/lib
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
