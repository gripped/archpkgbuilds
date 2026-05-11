# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Piotr Miller <nwg.piotr@gmail.com>

pkgname=nwg-look
pkgver=1.1.1
pkgrel=1
pkgdesc="GTK settings editor adapted to work on wlroots-based compositors"
url="https://github.com/nwg-piotr/nwg-look"
arch=('x86_64')
license=('MIT')
depends=(
  'glibc'
  'gtk3'
  'libatk-1.0.so'
  'libcairo-gobject.so'
  'libcairo.so'
  'libfontconfig.so'
  'libfreetype.so'
  'libgdk-3.so'
  'libgdk_pixbuf-2.0.so'
  'libgio-2.0.so'
  'libglib-2.0.so'
  'libgmodule-2.0.so'
  'libgobject-2.0.so'
  'libgtk-3.so'
  'libharfbuzz.so'
  'libpango-1.0.so'
  'libpangocairo-1.0.so'
  'libz.so'
  'xcur2png'
)
makedepends=(
  'go'
)
source=(https://github.com/nwg-piotr/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('568c5efe443892d74ffce6cf8ac7db2aea6071be70d97d3ba7c5efd8b351e601')
b2sums=('013c1916b3c5ddcae03a639f7a01c7ba55fc27e296b84907d23da3f79b1395a32fc2e7423019bb45a96274220f04d4a2d0943e60bec89ff9379f30ff5f614b5e')

build() {
  cd ${pkgname}-${pkgver}
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o bin/nwg-look \
    .
}

package() {
  make DESTDIR="${pkgdir}" install -C "${pkgname}-${pkgver}"
}

# vim: ts=2 sw=2 et:
