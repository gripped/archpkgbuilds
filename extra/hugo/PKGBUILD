# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Christian Rebischke <christian.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: fordprefect
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Brenton Horne

pkgname=hugo
pkgver=0.161.1
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go"
arch=('x86_64')
url="https://gohugo.io/"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('go' 'git')
optdepends=('git: required to use the Hugo modules feature'
            'go: required to use the Hugo modules feature'
            'dart-sass: required to transpile Sass to CSS'
            'python-docutils: required for reStructuredText support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gohugoio/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ab705db4c1d27d0803947338d3c05276f7260bed81acb28f15243cceec53e0720c8b80bf342232cb32282b8e28d8f594d40f037f2834499988380b5019a49450')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w -linkmode=external -buildid=''" -tags extended,withdeploy

  ./hugo gen man
  ./hugo completion bash > "${pkgname}.bash-completion"
  ./hugo completion fish > "${pkgname}.fish"
  ./hugo completion zsh > "${pkgname}.zsh"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm 644 man/*.1 -t "${pkgdir}/usr/share/man/man1/"
  
  install -Dm 644 "${pkgname}.bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm 644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
