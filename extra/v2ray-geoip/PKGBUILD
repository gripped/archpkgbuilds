# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202607011327
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('ca1cdc658507b44be174c8b3d1b98a66511be15c5ce6687bf4c2d19b7adbc264537ed5a7249ce716b696594b46e53db9bc04d75ef837b645fb52b9951fce00b8')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
