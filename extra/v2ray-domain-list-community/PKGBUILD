# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20250605152911
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('e71756e7ae8c098076c018a955261768a9ce6de137db4d7c93789c615a9bec678d139c55cfbf65c02b1142c7709c7549e2bb9ce96d728afe6e398cbd4a5c30db')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
