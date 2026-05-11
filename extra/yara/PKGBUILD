# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=yara
pkgver=4.5.6
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
source=(
  "https://github.com/VirusTotal/yara/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha512sums=('5da10d8f7c25cc80b159de33e65f310ebbb139621e53181900f31e564bf3d0998785a7f8dd9bfddb1fd97582d733b0230ff281e776266b31ba04ced197fe4b34')
b2sums=('b5d2ac8b8bd1322948ad9ec5da72cedc7c85a53d0c0c5c3dc78e10a6c6e548af9625eb6493614c991e0253f6ca35e8fc04791ce1d708005dd90f2ab93fb8ce94')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --with-crypto \
    --enable-magic
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
  rm -vr "$pkgdir/usr/share/doc/yara/docs/conf.py"
}
