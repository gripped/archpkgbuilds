# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20250407044718
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('f27ece751c026c80b5eacee77c797ae32762d3d14a76a1ddefb160694f34a8f3d60ab284a67bf8933e307d49b07711d466692ed54c1761f4691f77d22eecdc29')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
