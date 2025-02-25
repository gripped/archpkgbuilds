# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20250223232811
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('78df5c4b2876a418cd677ca3351929c8182576be35bd2dd01a1553a413beb667067adef9b6dbe01ea5a71bf7e069f588d51a501dc641e9e97e60e2549d6d7a1c')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
