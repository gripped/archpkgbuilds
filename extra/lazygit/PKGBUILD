# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: fuero <fuerob@gmail.com>

pkgname=lazygit
pkgver=0.58.1
pkgrel=1
pkgdesc='Simple terminal UI for git commands'
url='https://github.com/jesseduffield/lazygit'
arch=('x86_64')
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e4f0d4f3cebc70a802f95c52265e34ee879265103ebb70b5dd449ae791d0cbbb')
b2sums=('aeb3364cdc94d4f35cbb80c56668b8a0526f1df7c89a64d54a85b458e486a2f1d7c1ce6a1d81150322b40103b074fa76667a1838d54f804ae465498b080cbce0')

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
