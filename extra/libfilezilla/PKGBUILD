# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

pkgname=libfilezilla
epoch=1
pkgver=0.56.1
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs"
url="https://lib.filezilla-project.org/"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glibc' 'gmp' 'nettle' 'gnutls' 'libgcc' 'libstdc++' 'libnettle.so' 'libhogweed.so' 'libcrypt.so')
makedepends=('clang')
checkdepends=('cppunit')
provides=('libfilezilla.so')
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
#source=("https://download.filezilla-project.org/libfilezilla/libfilezilla-${pkgver}.tar.xz")
source=("https://sources.archlinux.org/other/libfilezilla/${pkgname}-${pkgver}.tar.xz")
sha512sums=('b488968ea8d0f8b4b83f45755303bf94a0118cded5fe911a187c532962e2445c2e2851311229cddcec3141d9e0d0a84076927812cd9a78b83ca0693dcc23fbfd')
b2sums=('dbd21a4ccf29624c41f959337cb48bed3e837fdb90b185b68eb30a6b52cc92bf4bfa7ceafb51cb7468e2950396ed06b419f25547b6dd8a2da9c2265bb2939e68')

build() {
  cd "${pkgname}-${pkgver}"
  export CXX=clang++
  export CC=clang
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
