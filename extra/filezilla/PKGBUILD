# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.69.4
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
sha256sums=('58c377b6ad3c9822b47594321b1620659baa2474a286a22875a718f5c1095b00')
sha512sums=('c2563725e727e5448d44f76ed5f9f21ae83585c2f70d4116936fdc56ebd271ea65b3eb2dc541d006d6703967c216553b82eee2d23e1d1cc9f8cb69c79ff488ca')

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
