# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor:Francois Menning <f.menning@pm.me>
# Contributor: gilbus <aur(AT)tinkershell.eu>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=thermald
_pkgname=thermal_daemon
epoch=2
pkgver=2.5.11
pkgrel=1
pkgdesc='The Linux Thermal Daemon program from 01.org'
arch=('x86_64')
url='https://github.com/intel/thermal_daemon'
license=('GPL2')
depends=(
  dbus-glib
  libevdev
  libxml2
  upower
)
makedepends=(
  autoconf-archive
  git
  gtk-doc
  python
)
source=(
  "git+https://github.com/intel/thermal_daemon.git#tag=v${pkgver}"
)
b2sums=('f3c315bb856a51a8a1a5c3008355b098f875deb3b7518854c29c3b8cb9c9fc3a321b9c0ed4b7c889dae5cefd211227999880da09a02c01a14c5a9b59068e93ae')

build() {
  cd ${_pkgname}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-dbus-sys-dir=/usr/share/dbus-1/system.d \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${_pkgname}
  DESTDIR="${pkgdir}" make install
}
