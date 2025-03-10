# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-validation-layers
pkgver=1.4.304.1
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
  lib32-wayland
  ninja
  python-lxml
  spirv-headers
  vulkan-headers
  vulkan-utility-libraries
)
options=(
  # https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994
  !lto
)
source=("git+https://github.com/KhronosGroup/Vulkan-ValidationLayers#tag=vulkan-sdk-$pkgver")
b2sums=('9fde10c02e31e0ed8d7ef90bf3ee6980dc383d9d786a3ce3a6dada1be3f7e777fd166d3522aacc2737f216b9694176ac818f52b6425bf07559cf6372d3940996')

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
