# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.14.2
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
sha512sums=('6cc676971aadfca3def51f62c4d0919765d2fa00693ae9e6fcc7eaaf637855a7b3803f27a9018f64cbf5325d1c67c9d1b84c4a0f32dac5ae3d1b9338842ba39b')
b2sums=('a60e9a12d4aa1a60c24ec1c5800c1c08ef95afe9200bf943fa384465886a939156e902367ce62673bbf78aa418de90e3446c3a8f8966de887441eb2f3862d943')

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
