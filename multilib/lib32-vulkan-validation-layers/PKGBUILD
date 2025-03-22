# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-validation-layers
pkgver=1.4.309.0
pkgrel=1
pkgdesc="Vulkan Validation Layers (32-bit)"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  lib32-gcc-libs
  lib32-glibc
  lib32-spirv-tools
)
makedepends=(
  cmake
  git
  lib32-libxrandr
  lib32-vulkan-icd-loader
  lib32-vulkan-utility-libraries
  lib32-wayland
  ninja
  python-lxml
  spirv-headers
  vulkan-headers
)
options=(
  # https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994
  !lto
)
source=("git+https://github.com/KhronosGroup/Vulkan-ValidationLayers#tag=vulkan-sdk-$pkgver")
b2sums=('d37ed99b0028d59d2b5567cd3feac23831bef7f38b6414d22496ad1405b42c33a86493ec5695c2b3f1c16030bd4b7ebfce0fc68ae7ae82e7a8ffec02b0a1438e')

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

  cmake -S Vulkan-ValidationLayers -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir/usr/share"
}

# vim:set sw=2 sts=-1 et:
