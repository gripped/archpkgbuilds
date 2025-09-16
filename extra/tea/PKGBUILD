# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: John K. Luebs <jkl at johnluebs dot tld>

pkgname=tea
pkgver=0.11.0
pkgrel=1
pkgdesc='A command line tool to interact with Gitea servers'
arch=(x86_64)
url='https://gitea.com/gitea/tea'
license=(MIT)
depends=(glibc)
makedepends=(git go)
replaces=(gitea-tea)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2f34729decbc34dfc67adf427ed8c94bc60c3ac45041d7638cf30785ed924c07a2aac89cda6babf660243eef82aa5dae5eced07c2107ad9c3745b2ebc3479c54')
b2sums=('4ea7cec14d78b25d89b1e5e64402f0b56549847adabd50b350f8b2dfcf43892b9b46f7919881f6a188cbea957daac907fc77f702f063e85a7926d6ed293431b3')

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
