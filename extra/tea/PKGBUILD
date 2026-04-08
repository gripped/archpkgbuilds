# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.13.0
pkgrel=1
pkgdesc='A command line tool to interact with Gitea servers'
arch=(x86_64)
url='https://gitea.com/gitea/tea'
license=(MIT)
depends=(glibc)
makedepends=(git go)
replaces=(gitea-tea)
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('9663e35315b4d3b688cca7d9f7fa7d9ea952fbfb8ae44beebd1996490cbf4d6186b3a1f97f2f02ab7280cda2be551e1de0f77a2bb91514a35416d96fb521d134')
b2sums=('e84b8fb96ed6f1921f9b2441845321f5e4118b48956d1d9ad4f88d2047dbf3ab1c7dfa220efe4a579378edeb1a0bdc8ebc4e3fb3728def1603de7c3da9f23451')

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # fix zsh completion
  sed -i "s/\$PROG/tea/" contrib/autocomplete.zsh

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}
build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  local TAGS=""

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}' \
    -X main.Version=${pkgver} \
    -X main.Tags=${TAGS}" \
    -o build \
    .
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/tea

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # completions
  install -vDm644 contrib/autocomplete.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 contrib/autocomplete.zsh "$pkgdir/usr/share/zsh/site-functions/_tea"
}
