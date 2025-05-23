# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-validation-layers
pkgver=1.4.313.0
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
b2sums=('c549cb272c91ef6b83bea5672e411be03efbda29d55e5aceeac5389f2453ef9b3ae0694bbeb3c50f1d29fd9cafc8dd3599f03652cda72010f8bd84a14fc4faa0')

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
