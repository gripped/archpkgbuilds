# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20240829
pkgrel=1
pkgdesc="Udev rules to connect Android devices to your linux box"
url="https://github.com/M0Rf30/android-udev-rules"
arch=('any')
license=('GPL-3.0-only')
depends=('udev' 'libmtp')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('01a9beab08b2436df90d76ba54e092925554a9a842281fd57275b622a6feed0c')

package() {
	cd "${pkgname}-rules-${pkgver}"
	install -Dm 644 51-android.rules "${pkgdir}/usr/lib/udev/rules.d/51-android.rules"
	install -Dm 644 android-udev.conf "${pkgdir}/usr/lib/sysusers.d/android-udev.conf"
}
