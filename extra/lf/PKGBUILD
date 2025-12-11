# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andrew Rabert <ar@nullsum.net>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Ian Beringer <ian@ianberinger.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf
pkgver=40
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger'
arch=(x86_64)
url='https://github.com/gokcehan/lf'
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#tag=r$pkgver")
sha512sums=('adf8cfcb91b4b3c84b36ccf63836c72509168c31579f445465ede77482cd8d7d31714758da62b7580d6764774437f82b62c5e358dca4fefa239b29602874d435')
b2sums=('022a36b42c03519e9a7bb12e2ec9a904bd37239189159d8ed60aec09b934c7afae8a41252551a80fce8f9a1feae6801de18667934eaa0c28e7f4cdfaa0c74a41')

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

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}' \
    -X main.gVersion=$pkgver" \
    -o build \
    .
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/lf

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" lf.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md etc/lfrc.example

  # desktop file
  install -vDm644 -t "$pkgdir/usr/share/applications" lf.desktop

  # vim integration
  install -vDm644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" etc/lf.vim
  install -vDm644 -t "$pkgdir/usr/share/vim/vimfiles/ftdetect" etc/lf.vim

  # shell integrations
  install -vDm644 -t "$pkgdir/etc/profile.d" etc/*.{sh,csh}
  install -vDm644 -t "$pkgdir/usr/share/fish/vendor_functions.d" etc/lfcd.fish

  # shell completions
  install -vDm644 etc/lf.bash "$pkgdir/usr/share/bash-completion/completions/lf"
  install -vDm644 etc/lf.fish "$pkgdir/usr/share/fish/vendor_completions.d/lf.fish"
  install -vDm644 etc/lf.zsh "$pkgdir/usr/share/zsh/site-functions/_lf"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
