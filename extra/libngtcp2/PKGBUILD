# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.16.0
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
sha256sums=('1f16fbd1c46cc8b8b76106ef890777dec73ef57c1cd567bf6d208f5a2c12ed5e')
b2sums=('1ce56060694ae6f576b0db3fb742188d6431b8425c27a52071283bd663d4b60a0f0264ffab5b727661c05d2f5682a807235c5ec582f05ef53dacc98671f47cde')

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
