# Maintainer:
# Contributor: Stanislaw Datskevich <me a nek0 net>
# Contributor: Gregor Robinson <gregor@fiatflux.co.uk>
# Contributor: Martin Perner <martin dot perner at gmail dot com>

pkgname=pkcs11-helper
pkgver=1.31.0
pkgrel=2
pkgdesc='A library that simplifies the interaction with PKCS11 providers for end-user applications using a simple API and optional OpenSSL engine'
arch=('x86_64')
url='https://github.com/OpenSC/pkcs11-helper'
license=('GPL-2.0-only' 'BSD')
depends=('gnutls' 'nss' 'openssl')
makedepends=('git')
provides=('libpkcs11-helper.so')
source=("git+https://github.com/OpenSC/${pkgname}#tag=${pkgname}-${pkgver}")
sha256sums=('477dcf27a2d2a278ec0f06e1bd7ffcc4fd0138b342986a267d6958a69c19266a')

prepare() {
  cd "${pkgname}/"

  # crypto-openssl: use ASN1_TIME_to_tm
  git show '59cc22b8d65669da599f1c435fdfe35d4e07db0e' -- lib/_pkcs11h-crypto-openssl.c | git apply

  libtoolize
  aclocal
  autoheader
  automake --add-missing
  autoreconf -v
}

build() {
  cd "${pkgname}/"

  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "${pkgname}/"

  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -D -m0644 COPYING* "${pkgdir}"/usr/share/licenses/${pkgname}/
}
