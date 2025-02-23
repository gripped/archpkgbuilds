# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=icewm
pkgver=3.7.0
pkgrel=1
pkgdesc="Window Manager designed for speed, usability, and consistency"
url="https://ice-wm.org/"
arch=('x86_64')
license=('LGPL-2.0-only')
depends=('alsa-lib' 'imlib2' 'librsvg' 'libsndfile' 'libxcomposite' 'libxdamage' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('asciidoctor' 'xorg-mkfontscale')
optdepends=('perl: for icewm-menu-xrandr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ice-wm/icewm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7021ee7c9845b091a981f820dbe2a0be2e3371c67f4442bb90ca350ff8b32029')

prepare() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
