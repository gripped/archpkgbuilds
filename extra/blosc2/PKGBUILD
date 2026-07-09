# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=blosc2
pkgver=3.1.5
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
sha512sums=('7f8401d2e28639d1e757bbb2c93fd8e4476c6f2b2c4514b550832ee51689dbe8aa8749fe7173b592c5debd2b63b924282f1a866b48b5d746607d5493e2627068')
b2sums=('b356e28959300165141fe105523458ffa732d269f9d4936116f4f9f69f7210b7a724e98870d4a0cbb850fb63f698ab32b23b7df1deebf4a26229e3bc6cfdb587')

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
