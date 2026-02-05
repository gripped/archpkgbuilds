# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andrew Rabert <ar@nullsum.net>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Ian Beringer <ian@ianberinger.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf
pkgver=41
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger'
arch=(x86_64)
url='https://github.com/gokcehan/lf'
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#tag=r$pkgver")
sha512sums=('6aa0b99895d5f13f352fbcf4f51dd716ae271ee9f68b0c00772a7dc2673f415f52214e1cafc22fea75a7269079dbbc376d7c5f91a468b094f8a115194ff1ac92')
b2sums=('670f60d2721ab2960eaa2636649a3b7fdb6a8a919787d951a731f565267a7c5ad92438fa28e161e538c3bf7068845e69f9d46bef5cb8b3d0936e7ea980a4b752')

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
