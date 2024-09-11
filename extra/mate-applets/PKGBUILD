# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-applets
pkgver=1.28.0
pkgrel=2
pkgdesc="Applets for MATE panel"
arch=('x86_64')
url="https://mate-desktop.org"
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=('cpupower' 'gtksourceview4' 'libgtop' 'libnotify' 'mate-panel' 'polkit' 'upower' 'wireless_tools' 'libnl')
makedepends=('autoconf-archive' 'intltool' 'itstool' 'mate-common' 'glib2-devel' 'gucharmap' 'yelp-tools')
optdepends=('fortune-mod: for displaying fortune cookies in the Wanda the Fish applet'
            'gucharmap: character picker applet')
groups=('mate-extra')
conflicts=('mate-applets-gtk3' 'mate-netspeed' 'mate-netspeed-gtk3')
replaces=('mate-applets-gtk3' 'mate-netspeed' 'mate-netspeed-gtk3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop/mate-applets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a54cd477c486fc3c1afcff4b3ae9d4275a1456c490f8c2514c90434e1491a46e')

prepare() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build() {
    	cd "${pkgname}-${pkgver}"
    	./configure \
        	--prefix=/usr \
        	--sysconfdir=/etc \
		--libexecdir="/usr/lib/${pkgname}" \
        	--with-dbus-sys="/usr/share/dbus-1/system.d" \
        	--enable-polkit \
        	--enable-ipv6
    	make
}

package() {
    	cd "${pkgname}-${pkgver}"
    	make DESTDIR="${pkgdir}" install
}
