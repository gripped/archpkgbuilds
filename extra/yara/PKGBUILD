# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=yara
pkgver=4.5.7
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
sha512sums=('ff53b0606fa947a9ab882c1e4c610586c28b8383873c4ee589e380e7478229e5ef11572650884dbcd8e487061f744e2e0ce70807bc9d8685e2cb4f781301a05b')
b2sums=('dcfc043416cbeb5c4306fd684288eefbd0297b5b88332d7196402d9a73fcc69c91f394003b4c955492736d9e062da2302ed332551ce65f2e45bb83ac90a1f06e')

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
