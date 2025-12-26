# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.19.0
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
sha256sums=('3bd1217c259d0a41807fe442368b9843ff2315910b7051211d0f24bac53acd39')
b2sums=('e4b0098b9d201dde3ded6280f658725eb6ca91e18476cc1f9319114fdeceac22ef8dd447c08dc69f8b53d26f18d7392acd3df3ee0d26558f5937f44da2c9fdcd')

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
