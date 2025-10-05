# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor:Francois Menning <f.menning@pm.me>
# Contributor: gilbus <aur(AT)tinkershell.eu>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=thermald
_pkgname=thermal_daemon
epoch=1
pkgver=2.5.10
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
b2sums=('80112fbfeb9a172d858901d72e22748ef648afc3ba1fad9dd3358d1d593bf603bd99de6798f25430bb455daeb144b33e8dc47b67fd0be788b3a66366dec11dec')

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
