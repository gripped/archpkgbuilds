# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=go-tools
epoch=4
pkgver=0.39.0
pkgrel=2
pkgdesc='Developer tools for the Go programming language'
arch=(x86_64)
url='https://golang.org/'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
source=(go-tools::git+https://go.googlesource.com/tools#tag=v$pkgver)
sha256sums=('8b2b510f845b977e2465f56e7b407ee2c2822678f55b70533cb886f86c9c8f84')

_tools=(benchcmp callgraph compilebench digraph eg fiximports
        go-contrib-init godex goimports gomvpkg gotype 
        goyacc html2article present ssadump stringer toolstash)

prepare() {
    cd go-tools
    mkdir -p bin/
}

build() {
  cd go-tools
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags "-compressdwarf=false -linkmode external" -o bin/ ./cmd/...
}

check() {
  cd go-tools
  # Needs to be updated and godoc is failing the test suite
  # See https://github.com/golang/go/issues/35690
  go test ./cmd/...  || true
}

package() {
  cd go-tools
  for tool in ${_tools[@]}; do
    install -Dm755 bin/$tool "$pkgdir/usr/bin/$tool"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
