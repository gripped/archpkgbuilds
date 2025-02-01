# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=BLAKE3
pkgname=(
  b3sum
  libblake3
)
pkgver=1.5.5
pkgrel=2
pkgdesc='Command line implementation of the BLAKE3 hash function'
arch=(x86_64)
url=https://github.com/BLAKE3-team/BLAKE3
license=('CC0-1.0 OR Apache-2.0 OR Apache-2.0 WITH LLVM-exception')
depends=(gcc-libs)
makedepends=(
  cmake
  git
  rust
)
source=("git+$url.git#tag=$pkgver")
b2sums=('9bbb2e15cec7c188af6ee5e24661d987424f6fd92769e6d5d4c7fd216d7494515b999845433fbe211d7569fa157a6c3216b69fe70e2f3dc2aa4fd2e1535d21cb')

prepare() {
  cd $_name/"${pkgname[0]}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local cmake_options=(
    -B build
    -S "$_name"/c
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_SHARED_LIBS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build

  cd $_name/"${pkgname[0]}"
  cargo build --release --locked --offline
}

check() {
  cd $_name/"${pkgname[0]}"
  cargo test --locked --offline
}

package_b3sum() {
  cd $_name/"${pkgname[0]}"
  install -Dt "$pkgdir"/usr/bin target/release/"${pkgname[0]}"
}

package_libblake3() {
  pkgdesc='The official C implementation of BLAKE3'

  DESTDIR="$pkgdir" cmake --install build
}
