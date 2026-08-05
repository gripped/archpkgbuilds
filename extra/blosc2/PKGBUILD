# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
pkgver=3.3.1
pkgrel=1
pkgdesc='A fast, compressed, persistent binary data store library for C'
arch=(x86_64)
url='https://www.blosc.org'
license=(BSD-3-Clause)
depends=(
  glibc
  lz4
  zlib-ng
  zstd
  zfp
)
makedepends=(
  git
  cmake
)
provides=(libblosc2.so)
source=("$pkgname::git+https://github.com/Blosc/c-blosc2#tag=v$pkgver")
sha512sums=('e689b14777e8b0b1676b4b65a43068673a09a2f806160691f6e22c15be7069b44901fd104fc05c9ba5af837da1e5b3b2b20a17e11099a552ec82b1dd53b01313')
b2sums=('96efe681cf72c0d3cc3d4a46d66bf8b262b396dfe68d371bebbb303ba13e2ffb380b7c0fdb5b535fe10979820cbd7b84e4437acaa6cdd761d7d25a01add6ccc1')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D PREFER_EXTERNAL_LZ4=ON
    -D PREFER_EXTERNAL_ZLIB=ON
    -D PREFER_EXTERNAL_ZSTD=ON
    -D BLOSC_DEPENDENCY_MODE=EXTERNAL
    -D BUILD_SHARED_LIBS=ON
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE.txt"
}
