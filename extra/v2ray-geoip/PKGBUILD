# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202312140039
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('0fdc26f03073dd2056fd707f7ac3bba9451a388841694b1a8fd1f9f41df07b2db065e3306bfb597bf5653e6c3e94fbebde0ba8c08348d71a10fc60b60017b990')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
