# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20261002050024
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('34211f6bf1dc067362b5535aaeddfa97f5303f43ead50de68e611bd4194a35917ec1967e51700d35f940083c65a206e4c926fe4057ddcc1284a943b9f91b826f')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
