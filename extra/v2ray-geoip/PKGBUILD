# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202412201411
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('44a20d60fa6b9f8bd9a6e578f0bfa24b8cd5fa8c783ed88999ffa510dde8600d8255691b223f3670042278718d218f678f59660d37aa6587f9e9ad10020cf028')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
