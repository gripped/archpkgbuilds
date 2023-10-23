# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.66.0
pkgrel=1
pkgdesc='Fast and reliable FTP, FTPS and SFTP client'
url='https://filezilla-project.org/'
arch=('x86_64')
license=('GPL')
depends=(
  dbus libdbus-1.so
  gtk3 libgtk-3.so libgdk-3.so
  hicolor-icon-theme
  libfilezilla libfilezilla.so
  nettle libnettle.so
  sqlite libsqlite3.so
  wxwidgets-gtk3
  xdg-utils
  )
makedepends=(
  boost
  gnutls
  libidn
)
source=(https://download.filezilla-project.org/client/FileZilla_${pkgver}_src.tar.xz)
sha256sums=('e78eb6bd861fc167b385aa2c05b6cac2dbbd901c4c8bf18a09724c33ab04be1b')
sha512sums=('8772987ed0772cb23f2ff15f7a9d8b24d9086b6f24d83c9aa430cbbb7c3e3b8fe209116ae590836e708db1a985539d214cd219413485823a7cc031462e20326d')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -vif
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-manualupdatecheck \
    --disable-autoupdatecheck \
    --with-pugixml=builtin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
