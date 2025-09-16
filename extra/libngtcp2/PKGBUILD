# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.15.1
pkgrel=1
pkgdesc='Implementation of IETF QUIC protocol'
url='https://github.com/ngtcp2/ngtcp2'
arch=('x86_64')
license=('MIT')
depends=(
  'glibc'
  'openssl' 'libssl.so'
  'gnutls'
)
makedepends=(
  'brotli'
)
provides=(
  'libngtcp2.so'
  'libngtcp2_crypto_gnutls.so'
  'libngtcp2_crypto_ossl.so'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1119e0c661cda5234cf6c3b9cbd17a16081730df18d5d0484c97e4a407dc6a97')
b2sums=('5a0c6f42f072335f8906d9d5aec30948f3466e2db860801b07f4162bdd23902a4fb94464f5fd7161ac9252ff70d5889a7e6f704a5507faff864ff69af2bdd490')

prepare() {
  cd ngtcp2-${pkgver}
  autoreconf -i
}

build() {
  cd ngtcp2-${pkgver}
  ./configure \
    --prefix=/usr \
    --with-libbrotlienc \
    --with-libbrotlidec \
    --with-gnutls \
    --enable-lib-only
  make
}

package() {
  cd ngtcp2-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 ./COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
