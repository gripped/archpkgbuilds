# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

pkgname=lib32-json-c
pkgver=0.17
_tagdate=20230812
pkgrel=2
pkgdesc="A JSON implementation in C (32-bit)"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64)
depends=(
  lib32-glibc
  json-c
)
makedepends=(
  cmake
  git
  ninja
)
provides=(libjson-c.so)
source=("git+https://github.com/json-c/json-c#tag=json-c-$pkgver-$_tagdate")
b2sums=('9e0b0f41703460a4a61bf4e2b005bbc436f0f563a1a82ce8acb399d5efa18744ec86e8610866568fc6f77e3eec097fd688cbb9cb6bfbf7179b8178d8ee2de3ff')

build() {
  local cmake_options=(
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32
    -DBUILD_STATIC_LIBS=OFF
    -DENABLE_THREADING=ON
    -DENABLE_RDRAND=OFF
  )

  export CC="gcc -m32" CXX="g++ -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S json-c -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir/usr/include"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 json-c/COPYING
}

# vim:set sw=2 sts=-1 et:
