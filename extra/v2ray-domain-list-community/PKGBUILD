# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=v2ray-domain-list-community
pkgver=20240324094850
_commit=558c0bfb7dd00dcaebc7bdd0942421b223b2db6a
pkgrel=1
pkgdesc="A list of domains to be used as geosites for routing purpose in Project V"
arch=('any')
url="https://github.com/v2fly/domain-list-community"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/v2fly/domain-list-community.git#commit=$_commit")
sha512sums=('e719936edbc18d1bfe34ec7b684b160b1cca5a96fa6965917db74869dcee856fc8b208798918f1e5ce330addb87f2aa7f0c05910ead81801ff20478a8e891416')

build() {
  cd domain-list-community
  ASSUME_NO_MOVING_GC_UNSAFE_RISK_IT_WITH=go1.18 go run main.go
}

package() {
  cd domain-list-community
  install -Dm644 dlc.dat "$pkgdir"/usr/share/v2ray/geosite.dat
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
