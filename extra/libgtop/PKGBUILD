# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libgtop
pkgver=2.41.4
pkgrel=1
pkgdesc='Library for collecting system monitoring data'
arch=(x86_64)
url='https://gitlab.gnome.org/GNOME/libgtop'
license=(GPL-2.0-or-later)
depends=(
  glib2
  glibc
  libxau
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
)
source=("git+https://gitlab.gnome.org/GNOME/$pkgname.git#tag=$pkgver")
b2sums=('472daacddf59a36aacf0f02da15289073772ed80e1279032ac038095af976e7a7fddb2f07cff3051d42c8af7b362bfc4d604146505389f49ad78dbfe9a42ca2b')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
