# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libopenmpt
pkgver=0.7.4
pkgrel=1
pkgdesc="A library to render tracker music to a PCM audio stream"
arch=(x86_64)
url="https://lib.openmpt.org/libopenmpt/"
license=(BSD-3-Clause)
depends=(
  flac
  gcc-libs
  glibc
  libogg  # required by pkgconf
  libpulse
  libsndfile
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
sha512sums=('512aa6a37b5eeb017604873bc1cbed4495116fd4bc3538bf83bc6b59e05178874ef08de11d95d30480b7081826352e00214f4713b5b75ea5593fba126d842034')
b2sums=('46e9132984a513a452ce762cddd097a00d5dce81c7370c1b577eef1f68f91fa9c3527e018531119ba016a246ae9882330f79f61f2f8accf2f28fd9b29dceaab9')

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
