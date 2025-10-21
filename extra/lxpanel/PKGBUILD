# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel
pkgver=0.11.1
pkgrel=3
pkgdesc='Lightweight X11 desktop panel for LXDE'
arch=(x86_64)
url='https://github.com/lxde/lxpanel'
license=(GPL-2.0-or-later)
groups=(lxde)
depends=(
  alsa-lib
  cairo
  curl
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  libfm
  libfm-gtk3
  libkeybinder3
  libwnck3
  libx11
  libxml2
  lxmenu-data
  menu-cache
  pango
)
makedepends=(
  git
  intltool
  wireless_tools
)
optdepends=('wireless_tools: netstat plugin')
conflicts=(lxpanel-gtk3)
replaces=(lxpanel-gtk3)
source=("git+https://github.com/lxde/lxpanel.git#tag=$pkgver")
b2sums=(9ae8710140db2e41091d22f42585c14186213a359cc0f48dc06dcf779d9cfa8ac57694d75efbd3ba080c4d276306bb6e278f0bad1bfd43f97c2cf9f7101ad6ad)

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-gtk3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
