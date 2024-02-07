# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.66.5
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
sha256sums=('92122819bae6341070ba4b6ecb457e6730b46e7dc89942990903f298903d1b3b')
sha512sums=('b250e65894a3e8c8eb0eac25b3ffa5cd1348df2a38b1e6fa5eb735fff1945dbeb1fbcfe10a8188c260e9fbeaeb78322cb8aa56f6386fd39803421d01bbc8b2dd')

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
