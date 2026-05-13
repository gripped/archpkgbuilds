# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20260510103350
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('d254dc7c08420d6833d88816fc65edde878d1143f898b4c202c1cc270ff5da7d4933835022ac53f0d69917102fc870aeaba0053cf08fa74a0209ee4c5d9348cc')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
