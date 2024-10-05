# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libngtcp2
pkgver=1.8.0
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
sha256sums=('05a2f7e7689588060875406fae12f10b23928fe73376ef0df4c3d467fd171696')
b2sums=('302c941c346593044aaa0a8c411488dca06136892d7d654443880beb59d14902cdf535d80d0a668cd0c6854a2fa69db4e2e772a8143b27512f6a5f632dfb2d15')

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
