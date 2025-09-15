# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=marco
pkgver=1.28.1
pkgrel=2
pkgdesc="MATE default window manager"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libcanberra' 'libgtop' 'mate-desktop' 'zenity' 'libxpresent' 'gettext' 'libxres' 'libsm')
makedepends=('autoconf-archive' 'mate-common' 'itstool' 'yelp-tools')
groups=('mate')
conflicts=('marco-gtk3')
replaces=('marco-gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop/marco/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3fd7f7cf0ad77770397e15478d198a5a4db518bba6565204ec073eac36be2a3b')

prepare() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build() {
	cd "${pkgname}-${pkgver}"
    	./configure \
        	--prefix=/usr \
        	--sysconfdir=/etc \
        	--localstatedir=/var \
        	--enable-startup-notification
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install
}
