# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=srt
pkgver=1.5.5
pkgrel=1
pkgdesc="Secure Reliable Transport library"
url="https://www.srtalliance.org/"
arch=(x86_64)
license=(MPL-2.0)
depends=(
  bash
  glibc
  libgcc
  libstdc++
  openssl
)
makedepends=(
  cmake
  git
  ninja
)
source=("git+https://github.com/Haivision/srt#tag=v$pkgver")
b2sums=('5f40bc6bbe461e71062efc59d30aef394ba1eb10dc78b276d14f23e982f89ecf73f364bd345ecde86a9f586ed779b2b6bf651b79d5ddaa396e37cadaf9b78164')

prepare() {
  cd srt
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DENABLE_STATIC=OFF
    -DENABLE_TESTING=ON
  )

  cmake -S srt -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  cd build
  ./uriparser-test
  ./utility-test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
