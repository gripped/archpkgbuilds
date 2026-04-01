# Maintainer: George Hu <integral@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgname=vokoscreenNG
pkgver=4.9.0
pkgrel=1
pkgdesc="Easy to use screencast creator"
arch=('x86_64')
url="https://linuxecke.volkoh.de/${pkgname}/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=(
	'glib2'
	'glibc'
	'gst-plugins-bad'
	'gst-plugins-base'
	'gst-plugins-base-libs'
	'gst-plugins-good'
	'gstreamer'
	'hicolor-icon-theme'
	'libgcc'
	'libpulse'
	'libstdc++'
	'libx11'
	'qt6-base'
	'qt6-multimedia'
	'wayland'
)
makedepends=('qt6-tools')
optdepends=('gst-plugin-pipewire: Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vkohaupt/${_pkgname}/archive/${pkgver}.tar.gz"
	"vokoscreenNG.appdata.xml")
sha256sums=('644978f0fd3a1c8caccf8cc18145cfa9108dc38d4facee75e336b2a5390bdd69'
            'b40fdfaf0166e1735be00a08bc55091176df758af7aff6585be4122423c73dda')

build() {
	cd "${_pkgname}-${pkgver}/"
	qmake6 PREFIX=/usr src/vokoscreenNG.pro
	make
}

package() {
	install -Dm644 "${_pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo/"

	cd "${_pkgname}-${pkgver}/"
	install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

	cd src/applications
	install -Dm644 "${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
	install -Dm644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}
