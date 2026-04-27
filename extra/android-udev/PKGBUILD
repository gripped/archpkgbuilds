# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: M0Rf30
# Contributor: marlock

pkgname=android-udev
pkgver=20260423
pkgrel=1
pkgdesc="Udev rules to connect Android devices to your linux box"
url="https://github.com/M0Rf30/android-udev-rules"
arch=('any')
license=('GPL-3.0-only')
depends=('udev' 'libmtp')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d5cfdbd2bc19dc560424c807298c6822daf4ed1cf8389373dfe029b5dfc7b1a2')

package() {
	cd "${pkgname}-rules-${pkgver}"
	install -Dm 644 51-android.rules "${pkgdir}/usr/lib/udev/rules.d/51-android.rules"
	install -Dm 644 android-udev.conf "${pkgdir}/usr/lib/sysusers.d/android-udev.conf"
}
