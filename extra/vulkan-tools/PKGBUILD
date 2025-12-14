# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-tools
pkgver=1.4.335.0
pkgrel=1
pkgdesc="Vulkan tools and utilities"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  libx11
  libxcb
  vulkan-icd-loader
  wayland
)
makedepends=(
  cmake
  git
  glslang
  libxrandr
  ninja
  python
  spirv-tools
  volk
  vulkan-headers
  wayland-protocols
)
groups=(vulkan-devel)
source=("git+https://github.com/KhronosGroup/Vulkan-Tools#tag=vulkan-sdk-$pkgver")
b2sums=('0546f1f888da255ea25624241537916fb28128147095565cf8417f7ab7b142504b24a5e4eb78082f5edbed983f474c83ae43ad108a85e10f73e1e44bdc506f90')

build() {
  local cmake_options=(
    -D BUILD_ICD=OFF
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
  )

  cmake -S Vulkan-Tools -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
