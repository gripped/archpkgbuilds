# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cmocka
pkgname=lib32-cmocka
pkgver=1.1.8
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects'
url='https://cmocka.org/'
arch=(x86_64)
license=(Apache-2.0)
depends=(
  cmocka
  lib32-glibc
)
makedepends=(cmake)
provides=(libcmocka.so)
options=(!lto)
source=(https://cmocka.org/files/1.1/$_name-$pkgver.tar.xz{,.asc})
sha512sums=('59c3d8732c5558abf4dd9aedac2d5e41cf7693c26a88932449c3dec7be7903c479515f15b4ab8876e4b03f3b4b68460ef34bc6ce079677262638c15e29da37ef'
            'SKIP')
b2sums=('c9c8751e43cf2584096432525d5cc0491ad895ac73b4071daedcc201f06292727dfae528060302d3ee6d5631b6898762be52cf6add8b90fdb9e8ce43f88abdf4'
        'SKIP')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -D UNIT_TESTING=ON
    -S $_name-$pkgver
    -W no-dev
  )

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rvf "$pkgdir/usr/include"
}
# vim: ts=2 sw=2 et:
