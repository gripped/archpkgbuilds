# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Bartosz Taudul <wolf@nereid.pl>

pkgname=lib32-vulkan-utility-libraries
pkgver=1.4.350.1
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
b2sums=('6d51fca913c43d545b32cb9af3fdaf024c962c2da4133616494ca97a3b9c57cc5f2cbaa7a4e1f3882f3d1bd7c5123172c042f63089d259f17bc769313b35f275')

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
