# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Piotr Miller <nwg.piotr@gmail.com>

pkgname=nwg-look
pkgver=1.2.0
pkgrel=1
pkgdesc="GTK settings editor adapted to work on wlroots-based compositors"
url="https://github.com/nwg-piotr/nwg-look"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gtk3' 'at-spi2-core' 'cairo' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'zlib' 'xcur2png')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('76c522473fbb07718a867ac12b9d752465003512b33760566391f8c7ce71438a')

build() {
	cd "${pkgname}-${pkgver}"
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
