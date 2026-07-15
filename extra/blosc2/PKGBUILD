# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
pkgver=3.2.1
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
sha512sums=('af337c1120537b919bb161bc08ca10df8698f0d18c292a7e4e18fc903648b17fd6c162226bf1617792ba380abe4cb39721f227841ca5c4772b303f549a753784')
b2sums=('6274011092e36fee3a136b60f5d8f01aca2ce6b3679c0089530641cb17d85796936254658cf9899ef1d3d29d6afcf973927ae0d8343acdcd97b4fb522183d5c9')

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
