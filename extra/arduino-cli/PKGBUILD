# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=arduino-cli
pkgver=1.4.1
pkgrel=1
arch=('x86_64')
pkgdesc='Arduino command line interface'
url='https://github.com/arduino/arduino-cli'
license=('GPL-3.0-only')
groups=('arduino')
depends=('glibc')
makedepends=(
  'git'
  'go'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('ba500af35055370b5e9684169e6ac795cf36ef13b5ef176955c4f10a80469eadf810641cecea9b604fd3406ea5c55075125028176d0595cfe9b226a60211d834')

prepare() {
  cd $pkgname
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build(){
  cd $pkgname
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw -buildvcs=false"
  export GOPATH="$srcdir"

  local ld_flags=" \
    -X github.com/arduino/arduino-cli/internal/version.versionString=$pkgver \
    -X github.com/arduino/arduino-cli/internal/version.commit=$(git rev-parse HEAD) \
    -compressdwarf=false \
    -linkmode=external \
  "
  go build -v -ldflags "$ld_flags" -o build/
}

check() {
  cd $pkgname
  local unit_tests=$(
    go list ./... \
      | grep -v github.com/arduino/arduino-cli/internal/arduino/monitor \
      | grep -v github.com/arduino/arduino-cli/internal/integrationtest \
      | grep -v github.com/arduino/arduino-cli/internal/version \
  )
  # shellcheck disable=SC2086
  go test -v $unit_tests
}

package() {
  cd $pkgname
  install -vDm755 -t "$pkgdir/usr/bin" build/$pkgname
}
