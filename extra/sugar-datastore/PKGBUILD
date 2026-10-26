# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=sugar-datastore
pkgver=0.122
pkgrel=1
pkgdesc='Sugar datastore service'
arch=(x86_64)
url='https://github.com/sugarlabs/sugar-datastore'
license=(GPL-2.0-or-later)
depends=(
  glib2
  glibc
  python
  python-dbus
  python-gobject
  python-xapian
)
makedepends=(git)
source=("git+https://github.com/sugarlabs/$pkgname.git#tag=v$pkgver")
b2sums=(dceccf00d395808e2127b045aa5e396684e5be521a5a1a0a8bf650c2be6f113791e312cd47b4f08fc1afe8004e41a710e6c914c2e997c6a7c9658755fead2510)

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
