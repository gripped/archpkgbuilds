# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=go-licenses
pkgver=2.0.0
pkgrel=1
pkgdesc="Reports on the licenses used by a Go package and its dependencies"
url="https://github.com/google/go-licenses"
arch=('x86_64')
license=('Apache-2.0')
depends=(
  'glibc'
)
makedepends=(
  'go'
)
# we can not use LTO as otherwise we get no reproducible package with full RELRO
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/google/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('b1dea2846510f7ce464902f7dacf13e896093ac2cbf6a7794bdde9457e5ff977')
b2sums=('2b292142345d35a523ba1f34df61238471ba5247668c9eddfbb54bfe7e2313e7bed03f4b17bd674360983ac990ed896134f74285b94666122f56a0308b427ccc')

prepare() {
  cd ${pkgname}-${pkgver}
  go mod download
}

build() {
  cd ${pkgname}-${pkgver}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_REQUIRED="1"

  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags '-compressdwarf=false -linkmode=external' \
    .
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
