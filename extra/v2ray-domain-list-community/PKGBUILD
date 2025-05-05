# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20250430053132
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('792689400b0808a7f9230dc58813beef9e4c65286ab426d06c0a257dec9a1905c2f1027f1bd2ffd67ac8f09fccd56e74b1d1a2d162410ae766bfb6b65b07f539')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
