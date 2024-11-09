# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20241109
pkgrel=1
pkgdesc="Udev rules to connect Android devices to your linux box"
url="https://github.com/M0Rf30/android-udev-rules"
arch=('any')
license=('GPL-3.0-only')
depends=('udev' 'libmtp')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('178251de2683dfe27d8bfd2259bc0bc8e38e68b3bc780baca68b8ae9d3d18aca')

package() {
	cd "${pkgname}-rules-${pkgver}"
	install -Dm 644 51-android.rules "${pkgdir}/usr/lib/udev/rules.d/51-android.rules"
	install -Dm 644 android-udev.conf "${pkgdir}/usr/lib/sysusers.d/android-udev.conf"
}
