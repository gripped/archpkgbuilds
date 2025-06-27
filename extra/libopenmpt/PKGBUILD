# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libopenmpt
pkgver=0.8.1
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
sha512sums=('f306fe15cbb7f2d0fd830d6237c52fb60196d5d011ef63f652091bde4780bee47d0e424cbb82431cdb2578f59dd426a3c8f8c914be7fecaa75fe4992a0ccba70')
b2sums=('7e0f300d4d93fb179080c7b7b83ba0df6b9fe00eee46c9e798a44f1a9f98f3a4de9d1ba3b4a1ac2585eef2e1ac857b76ce8cb1389c866b581be2a907ab99fb72')

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
