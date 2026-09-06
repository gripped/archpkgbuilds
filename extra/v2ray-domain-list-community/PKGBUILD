# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: DeepChirp <deepchirp@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20260904020013
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#tag=$pkgver")
sha512sums=('aecd3fedaa3589542a7f4848e50b69c7157d6502fe5881fca553fb8677aff1310abb39045d352fee9fd7b85def6d5d8c3545de1b31b7737c6ff61b4cff71f12e')

build() {
  cd domain-list-community
  go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
