# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Bartosz Taudul <wolf@nereid.pl>

pkgname=lib32-vulkan-utility-libraries
pkgver=1.4.309.0
pkgrel=1
pkgdesc="Vulkan Utility Libraries (32-bit)"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  lib32-glibc
  lib32-vulkan-icd-loader
  vulkan-utility-libraries
)
makedepends=(
  cmake
  git
  ninja
  python
  vulkan-headers
)
options=(
  # We are producing static libraries
  !lto
)
source=("git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries#tag=vulkan-sdk-$pkgver")
b2sums=('012f0489c7ba76f696c4b1792085397be3ed0858c666cea20e4d1e0e3369293af7edb7683396d28ae2e914b51366887da863f6920cbd4eb9033caae2b5401545')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
  )

  export ASFLAGS+=" --32"
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cmake -S Vulkan-Utility-Libraries -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir/usr/include"
}

# vim:set sw=2 sts=-1 et:
