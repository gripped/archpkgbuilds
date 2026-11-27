# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=filezilla
pkgver=3.72.1
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
sha256sums=('e7116a7ae8f6d3e4c9e337a0b042984b7c5b57fca922666ac3d8fcafba817764')
sha512sums=('4cac3c7665da76bbe44a69c9b0d9b23b21cd0e4f111de3b7ae4dbae69693c24ed6904b42e23cf9b0898c068a7b0ae75f4a82b755093c05fede9296302e88af20')

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
