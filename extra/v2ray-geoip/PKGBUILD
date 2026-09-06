# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>

pkgname=v2ray-geoip
pkgver=202609050329
pkgrel=1
pkgdesc="GeoIP List for V2Ray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("geoip-$pkgver.dat::https://github.com/v2fly/geoip/releases/download/$pkgver/geoip.dat")
sha512sums=('92ed79f92ef65ebaf50ca34625b7a4b476e2c47fe4d03c5056296ac0bd3dc34ec1c5d32ddcc59aceb0fa175a5cc473714bc1d509a0facabdd7f0ad3b631e0cb9')

package() {
  install -Dm644 geoip-$pkgver.dat "$pkgdir"/usr/share/v2ray/geoip.dat
}
