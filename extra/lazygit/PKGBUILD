# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: fuero <fuerob@gmail.com>

pkgname=lazygit
pkgver=0.62.2
pkgrel=1
pkgdesc='Simple terminal UI for git commands'
url='https://github.com/jesseduffield/lazygit'
arch=('x86_64')
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0bd1cdbaf1a584d2eb2fd14f068a8eaaeaeb80d3e2713c72005de9e4feaf6844')
b2sums=('12f4e369e245566500a1673f04d4c72d180d1ea657125fb305bc50735e9e8b817c3f2e5fa9b0475c412ef9784c43abdeae7a928213b484e627136776aa0377e8')

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
