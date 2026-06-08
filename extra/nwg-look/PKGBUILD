# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Piotr Miller <nwg.piotr@gmail.com>

pkgname=nwg-look
pkgver=1.1.1
pkgrel=3
pkgdesc="GTK settings editor adapted to work on wlroots-based compositors"
url="https://github.com/nwg-piotr/nwg-look"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gtk3' 'at-spi2-core' 'cairo' 'fontconfig' 'freetype2' 'gdk-pixbuf2' 'glib2' 'harfbuzz' 'pango' 'zlib' 'xcur2png')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('568c5efe443892d74ffce6cf8ac7db2aea6071be70d97d3ba7c5efd8b351e601')

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
