# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor:Francois Menning <f.menning@pm.me>
# Contributor: gilbus <aur(AT)tinkershell.eu>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=2.5.5
pkgrel=2
pkgdesc='The Linux Thermal Daemon program from 01.org'
arch=('x86_64')
url='https://01.org/linux-thermal-daemon'
license=('GPL2')
depends=('dbus-glib' 'libxml2' 'libevdev' 'upower')
makedepends=('autoconf-archive' 'python' 'gtk-doc')
source=(
  "https://github.com/intel/thermal_daemon/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  https://github.com/intel/thermal_daemon/commit/e49e4baf6ca12c647e8a4bc4e50743bc475d316a.patch
)
b2sums=('1d8c66e69c3c9d89a063a8ab8e9b8432afcfaf471cbf0f7a8e24d217c7449856de2a79c51fa2786deb6e8ed62f73a79489a1b66fc9655f36746e98a6924ae367'
        'e4c29a3b8b4d8a9f1ff88a2dd9e547a7b13a8f3aadd4690091334a622c1710e43214d87e7163194c7e4f8f082c50930a323e6b782c795ac2be7277ad7c684c18')

prepare() {
  cd ${_pkgname}-${pkgver}
  patch -Np1 < ../e49e4baf6ca12c647e8a4bc4e50743bc475d316a.patch
}

build() {
  cd ${_pkgname}-${pkgver}
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
  cd ${_pkgname}-${pkgver}
  DESTDIR="${pkgdir}" make install
}
