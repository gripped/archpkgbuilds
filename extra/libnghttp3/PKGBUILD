# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=libnghttp3
pkgver=1.0.0
pkgrel=1
pkgdesc="HTTP/3 library written in C"
url='https://github.com/ngtcp2/nghttp3'
arch=('x86_64')
license=('MIT')
provides=('libnghttp3.so')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ngtcp2/nghttp3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('838def499e368b24d8a4656ad9a1f38bb7ca8b2857a44c5de1c006420cc0bbee')

prepare() {
  cd nghttp3-${pkgver}
  autoreconf -i
}

build() {
  cd nghttp3-${pkgver}
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd nghttp3-${pkgver}
  make check
}

package() {
  cd nghttp3-${pkgver}/lib
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
