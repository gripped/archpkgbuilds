# Maintainer: George Hu <integral@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elrondo46 TuxnVape <elrond94@hotmail.com>
# Contributor: Ivan Fonseca <ivanfon@riseup.net>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Contributor: Giacomo <giacomogiorgianni at gmail dot com>

pkgname=vokoscreen
_pkgname=vokoscreenNG
pkgver=4.7.2
pkgrel=1
pkgdesc="Easy to use screencast creator"
arch=('x86_64')
url="https://linuxecke.volkoh.de/${pkgname}/${pkgname}.html"
license=('GPL-2.0-or-later')
depends=('gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'qt6-multimedia')
makedepends=('qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vkohaupt/${_pkgname}/archive/${pkgver}.tar.gz"
	"vokoscreenNG.appdata.xml")
sha256sums=('1bc7e4d1bd59b7aaa616e3648da3ae9f147e4c786b6059ce348731eced2d2802'
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
