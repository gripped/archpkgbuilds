# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202406270043
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('160170dad02918c1f0516fcf94eeeea5527c87eea5ba67ce52205b60b7a6892be9ddd242b8b7e8f2c720e39f3c92f830947e5ec719558185f8c15188e3e01a48')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
