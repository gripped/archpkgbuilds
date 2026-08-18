# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libopenmpt
pkgver=0.8.8
pkgrel=1
pkgdesc="A library to render tracker music to a PCM audio stream"
arch=(x86_64)
url="https://lib.openmpt.org/libopenmpt/"
license=(BSD-3-Clause)
depends=(
  flac
  glibc
  libgcc
  libogg  # required by pkgconf
  libpulse
  libsndfile
  libstdc++
  libvorbis
  mpg123
  portaudio
  zlib
)
makedepends=(
  autoconf-archive
  doxygen
  help2man
)
provides=(libopenmpt.so)
source=($pkgname-$pkgver.tar.gz::https://lib.openmpt.org/files/libopenmpt/src/$pkgname-$pkgver+release.autotools.tar.gz)
sha512sums=('10f84c68a02ab3ad292bce4ceef4d8c0afc5127e52164ebe9f96c26d3b4833e9fe25370341f98de6682053624a957a3e8d874a34d16b246cef6ba12d225c61a6')
b2sums=('0690b10136155d25966796a0d9dbdc11b566ae212a98eb7e65b302a4b269340816c567b3df69f8a964e4aa2df651b59522d72012dfcaf101cbb7d62cc114c6e6')

prepare() {
  cd $pkgname-$pkgver+release.autotools
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver+release.autotools
  ./configure --prefix=/usr
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  make -k check -C $pkgname-$pkgver+release.autotools
}

package() {
  cd $pkgname-$pkgver+release.autotools
  make DESTDIR="$pkgdir" install
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
