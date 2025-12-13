# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=lib32-vulkan-icd-loader
pkgver=1.4.335.0
pkgrel=1
pkgdesc="Vulkan Installable Client Driver (ICD) Loader (32-bit)"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(lib32-glibc)
makedepends=(
  cmake
  git
  lib32-libx11
  lib32-libxrandr
  lib32-wayland
  ninja
  python-lxml
  vulkan-headers
)
optdepends=(
  # vulkan-driver: vulkan-intel/vulkan-radeon/nvidia-utils/....
  'lib32-vulkan-driver: packaged vulkan driver'
)
provides=(libvulkan.so)
source=("git+https://github.com/KhronosGroup/Vulkan-Loader#tag=vulkan-sdk-$pkgver")
b2sums=('f6959746621669e8f868a70f04cdbacdb45ddf4b674b62b4ae6bb7c2f15ae6243a1a7b775b253268be51f5bf07c18665101ec97b02da120e29c5ca0b477b087f')

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

  cmake -S Vulkan-Loader -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
