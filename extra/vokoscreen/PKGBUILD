# Maintainer: George Hu <integral@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgname=vokoscreenNG
pkgver=4.8.3
pkgrel=1
pkgdesc="Easy to use screencast creator"
arch=('x86_64')
url="https://linuxecke.volkoh.de/${pkgname}/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'qt6-multimedia')
makedepends=('qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vkohaupt/${_pkgname}/archive/${pkgver}.tar.gz"
	"vokoscreenNG.appdata.xml")
sha256sums=('2e9d69e77de3e782b663056e040d649f60de651d1537a8b3ab124bf6f71c1232'
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
