# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Bartosz Taudul <wolf@nereid.pl>

pkgname=lib32-vulkan-utility-libraries
pkgver=1.4.341.0
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
b2sums=('31148920b097eca4c002e635bf768c84baf0bded26858d16732094da232ee8aacea49e3060c972b678281765832abdb5184d5d4867c674b122b9b4284626416a')

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
