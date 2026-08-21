# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.71.0
pkgrel=1
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
sha256sums=('bb107bafc2d8fedaf3d9dbb032b967611d4e29a298b10afa3b8bdff15592cc9b')
sha512sums=('91051b16fb871b2fcf169db908a7a136d90d79b1cb00adfd87d1c52836d52be0014119d4dd206c533f5ec8560f821ce5c00335c2f36ba404ba42bd545a1d87ae')

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
