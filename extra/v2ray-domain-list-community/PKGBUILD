# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20261025014458
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('beb1c2853e3d9e4e19e23761b3ff5655b82f0f333c496aac62c0887f4bce6833c1d3d47a493c5797de8191609602f9851295d9fa732f6a336cefe57c91c22b39')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
