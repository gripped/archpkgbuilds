# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: fuero <fuerob@gmail.com>

pkgname=lazygit
pkgver=0.62.1
pkgrel=1
pkgdesc='Simple terminal UI for git commands'
url='https://github.com/jesseduffield/lazygit'
arch=('x86_64')
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('198602c75c0d971b56088d6d364aaf9b2fd52bcadcb0e6a8548df0ed43e4dac2')
b2sums=('9fb9cd74767cb66d0f4a0e2c69c4a8b08dbd69c86dc975032c4289948e67522b15c66680147608c4e9e7e2230af51b2ad9865406e8b87a7ae1c4a10bac221d0e')

build() {
  cd ${pkgname}-${pkgver}

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -x -v"

  go build \
    -ldflags "\
      -linkmode external \
      -extldflags '${LDFLAGS}' \
      -X main.date=$(date --date=@${SOURCE_DATE_EPOCH} -u +%Y-%m-%dT%H:%M:%SZ) \
      -X main.buildSource=binaryRelease \
      -X main.version=${pkgver} \
      -X main.commit=v${pkgver} \
    "
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 lazygit -t "${pkgdir}/usr/bin"
  install -Dm 644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
