# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-icd-loader
pkgver=1.4.304.1
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
groups=()
source=("git+https://github.com/KhronosGroup/Vulkan-Loader#tag=vulkan-sdk-$pkgver")
b2sums=('537e5a325d1833aece5ff69af9b8118934581fbb58d5b1885d2b0d3d55f2ff3ef2db6c3a686c40c9e068c9b80194030cf936cba45fee70f55a6185f6c93ffffd')

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
