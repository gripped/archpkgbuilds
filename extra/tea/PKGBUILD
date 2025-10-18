# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.11.1
pkgrel=1
pkgdesc='A command line tool to interact with Gitea servers'
arch=(x86_64)
url='https://gitea.com/gitea/tea'
license=(MIT)
depends=(glibc)
makedepends=(git go)
replaces=(gitea-tea)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('668655806d9b428538623a0341232ded7f3a79f6fdf061c9f64e6916904cb8e8a36d6a3cfaf27f03bb90bb32c88212434d418987a373ce8c772fbaa24bc8e6b2')
b2sums=('b3fcdee0f7c76716e73a1541ddcd03677128290c1964d89fb24b9a9148c0316f5bbb4e470e156dc8e6c967acd16f40ec19684bb3e5bac1c0c679f1dadab5b9c3')

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
