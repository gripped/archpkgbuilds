# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202504050136
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('a4a952163ae383715cf73f17aab11cc716e9094e0216e827c826b0369680954754773d82d1bff26ae37399f406b44c25e8bb1cb58749d1226cda2d093b49a775')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
