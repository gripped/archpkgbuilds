# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: bitwave <aur [aT] oomlu [d0T] de>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=yara
pkgver=4.5.5
pkgrel=1
pkgdesc='Tool aimed at helping malware researchers to identify and classify malware samples'
arch=(x86_64)
url='https://github.com/VirusTotal/yara'
license=(BSD-3-Clause)
depends=(
  glibc
  openssl
  file
  libmagic.so
)
provides=(libyara.so)
source=("https://github.com/VirusTotal/yara/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e71d6e435cb2ad7b5875ccabcfe3abe42e2f37187a22e778867c5c5762134961369c2cbd4bea8da9193d5381af4569e39a50156d4077dc3a23b9a2240b741b60')
b2sums=('c990d2a1ae24cabb9e873b369dc5803157663c996ba8cf327cb12059cb704998f7bc437df2eb8ac9973a163163352cbb19ec5edc0a508a3ee8c25a2733b9a39c')

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
