# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.15.1
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
sha512sums=('8e4cdbdc2a79bf159b46c9e9d1a58ed98d6929a57fd7993bd2e9ea75e7c861c0b1a60823e5ae7abba9cad13b5b67d9dbf56194a6d595dfa30d0ab933c8267b8f')
b2sums=('bfb41e206799beecfaaa6db89c31d7af7d219188e4b71cd724917b3c2179f0d04ac2ad91e30402a07a64bf364359b0d4072c21aa3f492f0c32c3952890d09055')

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
    -X gitea.dev/tea/modules/version.Version=${pkgver} \
    -X gitea.dev/tea/modules/version.Tags=${TAGS}" \
    -o build \
    .

  # generate shell completions
  for shell in bash fish zsh; do
    build/tea completion "$shell" > build/"${shell}-completion"
  done

  # generate man page
  build/tea man --out build/tea.1
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
  install -vDm644 build/tea.1 \
    "$pkgdir/usr/share/man/man1/tea.1"
}
