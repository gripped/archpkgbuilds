# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-geoip
pkgver=202511050144
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('67976a0ae790911bed96626f23b5936df8d6f07f1f52c78b910eb3222b4a9977dc7da13ce1d2df494835503469c4ec955c96f4f87867db826ce1cd6ea3e598ba')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
