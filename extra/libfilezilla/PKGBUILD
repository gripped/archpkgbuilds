# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Martchus <martchus@gmx.net>

pkgname=libfilezilla
epoch=1
pkgver=0.55.5
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
sha512sums=('e5654757630ef6fae1b3fbef04b8fca7e3122585cf9274131af7e18127363b143ce91a277721da54ebf67245f31422e8351fe0c419f533360ff86c419c2473ea')
b2sums=('673fc5b452424b4be81b0f4c75e7c494d19665f1a55a1eef5bec7324f50ac3024523c3cf7116a3e93c466c1a5eacfe220fa035cc2e0979ba4bb7cd8b5258dcd7')

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
