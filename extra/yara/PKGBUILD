# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=yara
pkgver=4.5.4
pkgrel=1
pkgdesc='Tool aimed at helping malware researchers to identify and classify malware samples'
url='https://github.com/VirusTotal/yara'
arch=(x86_64)
license=(BSD-3-Clause)
depends=(
  glibc
  openssl
  file
  libmagic.so
)
provides=(
  libyara.so
)
source=(https://github.com/VirusTotal/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b1da40636f9e55bb07cc911479e6dfa8dc7a4fa3f6b9f10b9f669d741d7af51a1d31e044f9842ec3ab9c6ac9788fbdb89a1686c9e3f22f68d1f9e5fb3db22167')
b2sums=('4a3c6c97031b0033be1cc9e3d0436c2def2c732bc3cc6289b8eec58b99336d15eb9d491858ac4744ee05e35fc6cfc61c071947ecc8ad01401d0863968c3aa283')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --with-crypto \
    --enable-magic
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
