# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: fuero <fuerob@gmail.com>

pkgname=lazygit
pkgver=0.61.1
pkgrel=1
pkgdesc='Simple terminal UI for git commands'
url='https://github.com/jesseduffield/lazygit'
arch=('x86_64')
license=('MIT')
depends=('git' 'glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a550c9b609c5eb0e1c2640e8114ac05b94c671803f77e08a9dcdbd66372e2c4')
b2sums=('ee81a42d2fced530621b9e6affd418346908ccaa9f0ec9e8f312e8a6d71c5118f91f8288e473ff00c05b7e5197c1fab205843d422085547beb8517bbca82de08')

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
