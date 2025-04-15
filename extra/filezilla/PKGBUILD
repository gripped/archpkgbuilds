# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.69.0
pkgrel=1
pkgdesc="Fast and reliable FTP, FTPS and SFTP client"
url="https://filezilla-project.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
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
# Upstream download link became (purposely) unstable
# See https://trac.filezilla-project.org/ticket/13186
#source=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_src.tar.xz")
source=("https://sources.archlinux.org/other/filezilla/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b3a5caaad90c4841ae9be225ce150af28abc3ec88903922bb5661940a5fac8f3')
sha512sums=('65a777b7495570b652c352f2871c685591812a6b62b06607c6456604170e2c968d349516d3d47f92d62a7de81186943f16af13f208e098c91df48bfcb33e0adf')

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
