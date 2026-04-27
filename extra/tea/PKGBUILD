# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.14.0
pkgrel=2
pkgdesc='A command line tool to interact with Gitea servers'
arch=(x86_64)
url='https://gitea.com/gitea/tea'
license=(MIT)
depends=(glibc)
makedepends=(git go)
replaces=(gitea-tea)
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('939ddc14c70485851f4d65ac9283f7f502c6031f8bd9ceeabe377c2854f479a1e2440801ef3467e198bbd480214cbfbe258d279992c6d2e6ac1c3e6a0a7e6acd')
b2sums=('879b0e2a55c43d3548612efb272e07fcdd240e5ae518bd7bfe1e8247b178687f4a6b842d41658d356fc4565e7d43da905077eace2706d8746bdc6b7b28c4d240')

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

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
    -X code.gitea.io/tea/modules/version.Version=${pkgver} \
    -X code.gitea.io/tea/modules/version.Tags=${TAGS}" \
    -o build \
    .

  # generate shell completions
  for shell in bash fish zsh; do
    build/tea completion "$shell" > build/"${shell}-completion"
  done

  # generate man page
  build/tea man --out build/tea.8
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/tea

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # shell completions
  install -vDm644 build/bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/tea"
  install -vDm644 build/fish-completion \
    "$pkgdir/usr/share/fish/vendor_completions.d/tea.fish"
  install -vDm644 build/zsh-completion \
    "$pkgdir/usr/share/zsh/site-functions/_tea"

  # man page
  install -vDm644 build/tea.8 \
    "$pkgdir/usr/share/man/man8/tea.8"
}
