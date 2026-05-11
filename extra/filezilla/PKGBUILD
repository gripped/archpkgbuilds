# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.70.5
pkgrel=2
pkgdesc="Fast and reliable FTP, FTPS and SFTP client"
url="https://filezilla-project.org"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  dbus libdbus-1.so
  fzssh
  gtk3 libgtk-3.so libgdk-3.so
  hicolor-icon-theme
  libfilezilla libfilezilla.so
  sqlite libsqlite3.so
  wxwidgets-gtk3
  xdg-utils
  )
makedepends=(
  boost
  gnutls
  libidn
)
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
#source=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_src.tar.xz")
source=("https://sources.archlinux.org/other/filezilla/${pkgname}-${pkgver}.tar.xz")
sha256sums=('77c16c25fb1d94d51294b01efd20d3e5cc119844857e4b43982aca6b898ee5d6')
sha512sums=('09e7b924d0aa5ebdc078b2ba0ce579a229612be8a4b46581bc9688825c6be2fac2897f9041c88e6710fb08873f13691dff30bd607e56aca79758897fb7494296')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -vif
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-manualupdatecheck \
    --disable-autoupdatecheck \
    --with-pugixml=builtin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/share/{appdata,metainfo}
}

# vim: ts=2 sw=2 et:
