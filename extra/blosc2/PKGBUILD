# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
pkgver=3.3.4
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
sha512sums=('d61b1ccf869c858351e1e3be3630aefd2f282b61c944abe65bacd44692ef1782438c92190e3f2b2bf2f004b04b928ae7ca3a2b7955015a50c71391a01a02ee11')
b2sums=('0a180b7bf1dd6ea597352016e942fdd168c9e5bd3707dc13ae05292a25a472a414db51d5317ab1d33b663f39d384b2daf1da60c5da521a057f70eadefc80d43b')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -W no-author
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
