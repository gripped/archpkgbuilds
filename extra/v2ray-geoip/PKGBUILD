# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202406130042
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('a92894ba65c03bd249d233bb3d7e5930e6a017d76caeaa38574f6fd4631237d4be8841af9608c7d047da876398d672bd4c3dcebf189b717b076e8ca4f6f49686')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
