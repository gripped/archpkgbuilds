# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=osm-gps-map
pkgver=1.2.0
pkgrel=3
pkgdesc="Gtk Widget for Displaying OpenStreetMap tiles"
arch=(x86_64)
url="https://github.com/nzjrs/osm-gps-map"
license=(GPL-2.0-or-later)
depends=(gtk3 libsoup3)
makedepends=(gtk-doc gobject-introspection)
source=(https://github.com/nzjrs/osm-gps-map/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz
        0001-Drop-support-for-libsoup-older-than-2.42.patch
        0001-Port-to-libsoup3.patch)
sha256sums=('ddec11449f37b5dffb4bca134d024623897c6140af1f9981a8acc512dbf6a7a5'
            'f9a2b97b8a00d98844747fdad288c74c07779ec941ea9f3f036be28ff5c5a4d0'
            'fe5d9bcf4c00f970788878528d59995ba744dcf0baaeedfc24929233a41544e4')

prepare() {
  cd ${pkgname}-${pkgver}

  # Port to libsoup3
  # https://github.com/nzjrs/osm-gps-map/pull/99
  patch -Np1 -i ../0001-Drop-support-for-libsoup-older-than-2.42.patch
  patch -Np1 -i ../0001-Port-to-libsoup3.patch

  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
