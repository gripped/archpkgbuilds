# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=bazelisk
pkgver=1.28.1
pkgrel=1
pkgdesc='A user-friendly launcher for Bazel.'
arch=('x86_64')
url="https://github.com/bazelbuild/bazelisk"
license=('Apache-2.0')
makedepends=(
    'go'
    'git'
)
depends=(
    'glibc'
)
provides=('bazel')
conflicts=('bazel')
source=("git+https://github.com/bazelbuild/bazelisk#tag=v$pkgver")
sha256sums=('90ddeed84af7001fb0519fe3d79da26f7451ffda9323cef7f793015eb9504eac')
options=(!lto)

prepare(){
  cd "$pkgname"

  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  ln -s /usr/bin/bazelisk $pkgdir/usr/bin/bazel
}
