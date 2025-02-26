# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=BLAKE3
pkgname=(
  b3sum
  libblake3
)
pkgver=1.6.0
pkgrel=1
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
b2sums=('b8a43aa3eae98caf1f61275eebc205a33ef0d513a82fd99aefaf1659bd068f8ea485c5f3beac0e5c3f23f917def4f8c3903c08f9137087a6ab78af347b571d3e')

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
