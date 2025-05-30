# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor:Francois Menning <f.menning@pm.me>
# Contributor: gilbus <aur(AT)tinkershell.eu>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=2.5.9
pkgrel=3
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
b2sums=('bd4bb51710363cb14c8343f26bb895bdd8335fe7bb48b42452d812157e5b08d4ac96e0027ff9d648633d2aa10dd160957cb6fa7a3ca579749b02f533e6be5f44')

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
