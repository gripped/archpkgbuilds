# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.9.1
pkgrel=1
pkgdesc='Implementation of IETF QUIC protocol'
url='https://github.com/ngtcp2/ngtcp2'
arch=('x86_64')
license=('MIT')
depends=(
  'glibc'
  'gnutls'
)
makedepends=(
  'brotli'
)
provides=(
  'libngtcp2.so'
  'libngtcp2_crypto_gnutls.so'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99f734cb3c494bd612c9c84cb8a76c074224f1312bc79ec1dee12b2afb88e379')
b2sums=('812600fa5fcf757b76e48b8998a33f9e7c75e35b64cbfa2002fbe78d4748001b9b50462a4032a27d7d205b9381808ad7779617e0998afc7b443bfd92dcda7cba')

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
