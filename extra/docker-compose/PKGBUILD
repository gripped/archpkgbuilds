# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Vincent Demeester <vincent@sbr.io>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=docker-compose
pkgver=2.26.1
pkgrel=1
pkgdesc="Fast, isolated development environments using Docker"
arch=('x86_64')
url="https://www.docker.com/"
license=("Apache-2.0")
makedepends=('go')
checkdepends=('docker')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/compose/archive/v$pkgver.tar.gz")
b2sums=('464afc0f4d41165b97c1c35f2fcf57916ea8e7da367b43c7efb0d863416ae3b13a243f56dd2261eec0f3c7465999ce5505bb62a2bc61c1e80998c2bacec905c5')

build() {
  cd "compose-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  GO_LDFLAGS="-linkmode=external -compressdwarf=false -X=github.com/docker/compose/v2/internal.Version=${pkgver}"
  go build -ldflags "${GO_LDFLAGS}" -trimpath -tags "e2e,kube" -o compose ./cmd
}

check(){
  cd "compose-$pkgver"
  rm pkg/compose/ps_test.go
  go test -tags "e2e,kube" -v $(go list -tags "e2e,kube" ./... | grep -vE 'e2e')
}

package() {
  cd "compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 compose "$pkgdir"/usr/lib/docker/cli-plugins/docker-compose
  install -d "$pkgdir/usr/bin"
  ln -sf /usr/lib/docker/cli-plugins/docker-compose "$pkgdir/usr/bin/docker-compose"
}
