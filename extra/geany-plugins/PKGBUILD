# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@gmail.com>
# Contributor: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=geany-plugins
pkgver=2.0
pkgrel=6
pkgdesc='Plugins for Geany'
arch=(x86_64)
url='https://plugins.geany.org/'
license=(GPL-2.0-or-later)
depends=(ctpl "geany>=$pkgver" gpgme gtkspell3 libgit2 lua51 python vte3 webkit2gtk)
makedepends=(intltool)
source=("$url$pkgname/$pkgname-$pkgver.tar.bz2"{,.sig}
         https://github.com/geany/geany-plugins/commit/f1148d56.patch)
validpgpkeys=('986FA7E80256D3D16F30FB7A01380DF54FD09D02') # Frank Lanitz <frank@geany.org>
b2sums=('6175f91a3a7effa081393e9397336e0f5f59846fdadd0e31584f237c14863016cc4ab1b17745e1e2804ad88161dc7e43aef97a2332a5c18a7f1baf10d2ea42ba'
        'SKIP'
        'ac4b9605c0f39139d38d3676355e7b1b453d9088251d365e49ff5ded50463463141eed5ea720193b4f5df6198138aa3fed9223b75b6e5e3339c4526b02a013b8')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../f1148d56.patch # Fix build with GCC 15
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  export CFLAGS+=' -Wno-incompatible-pointer-types -w' PYTHON=/usr/bin/python
  ./configure \
    --libexecdir=/usr/lib \
    --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
