pkgname=bazelisk
pkgver=1.25.0
pkgrel=5
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
sha256sums=('f0244c0b001e8eb629af90e33057c62e65157928a3d7f56cfbbcf4cecb675283')
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
