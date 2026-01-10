# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mozo
pkgver=1.28.0
pkgrel=5
pkgdesc="MATE menu editing tool"
url="https://mate-desktop.org"
arch=('any')
license=('LGPL-2.1-or-later')
depends=('gtk3' 'python>=3.5' 'mate-menus' 'python-gobject' 'gettext' 'mate-panel')
makedepends=('autoconf-archive' 'mate-common')
groups=('mate-extra')
conflicts=('mozo-gtk3')
replaces=('mozo-gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop/mozo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eb1d5af4ac0c72268e78deca888ae00c604ddfd67d50989ab0f7f82bc8fbcbef')

prepare() {
    	cd "${pkgname}-${pkgver}"
	autoreconf -fiv -I /usr/share/gettext/m4/
}

build() {
    	cd "${pkgname}-${pkgver}"
    	PYTHON=/usr/bin/python ./configure \
        	--prefix=/usr
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install
}
