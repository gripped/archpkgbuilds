# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.14.1
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
sha512sums=('4530e4557e300665a5b5015696962fff5a7fcfc7b682ea1fc53d51bf0679598e335f2099df759311af40062e7479eaf4e7906bc9f34d000ca3793a9ece90a64c')
b2sums=('59736b17c1a3352010c7577c8d7afe96864839ddf1182c2fbaf81013f5baef542cba3d8da06c48a326419df8b4983e6968eae4f210fd8812065984f9c6fff3ea')

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
