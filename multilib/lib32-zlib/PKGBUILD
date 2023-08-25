# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_name=zlib
pkgname=lib32-$_name
pkgver=1.3
pkgrel=1
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP (32-bit)'
arch=(x86_64)
license=(Zlib)
url="https://www.zlib.net/"
depends=(
  lib32-glibc
  $_name=1:$pkgver
)
provides=(libz.so)
source=(https://github.com/madler/zlib/releases/download/v$pkgver/$_name-$pkgver.tar.xz{,.asc})
sha512sums=('3868ac4da5842dd36c9dad794930675b9082ce15cbd099ddb79c0f6bd20a24aa8f33a123f378f26fe0ae02d91f31f2994dccaac565cedeaffed7b315e6ded2a2'
            'SKIP')
b2sums=('5fe0f32339267348a313f23a21e9588bdb180b7415be303c85f5f169444d019e5f176ef7322f6e64297c360acc2a6041c50e2f66d1860e5c392d8970990f176a'
        'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  make test -C $_name-$pkgver
}

package() {
  make install DESTDIR="$pkgdir" -C $_name-$pkgver

  rm -rf "$pkgdir"/usr/{include,share,bin}
  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
