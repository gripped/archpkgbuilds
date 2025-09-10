# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202509050142
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('9fc78c4fe1b5d3c026aa1e043e72e6a87f590919055b7ebcdb739c614e6b13c377b888b6219309950fdd717fc6e82a4014af30de95172414671c410ee3a2fa4a')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
