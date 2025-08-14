# Maintainer: Christian Heusel <gromit@archlinux.org>

pkgname=bazelisk
pkgver=1.27.0
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
sha256sums=('f11a26f40961a59462575ab810e425555f3d70ff805f6edd1a1caeee22d91333')
options=(!lto)

prepare(){
  cd "$pkgname"

  # https://github.com/bazelbuild/bazelisk/issues/679
  git cherry-pick -n de10a0b820c7d0cd8d1a4c278646b80794753f94

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
