# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=spirv-tools
pkgver=1.4.321.0
pkgrel=1
epoch=1
pkgdesc="API and commands for processing SPIR-V modules"
url="https://www.khronos.org/spirv/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  sh
)
makedepends=(
  cmake
  git
  ninja
  python
  spirv-headers
)
groups=(vulkan-devel)
source=("git+https://github.com/KhronosGroup/SPIRV-Tools#tag=vulkan-sdk-$pkgver")
b2sums=('2ea34e70c60286bdc9526e47c421d29d3a076228a9237f6829ee5a41a31c196821e9fb5ea1d809d0d8d60643e706a90755193018330490b44280c9d48d1d42e9')

build() {
  local cmake_options=(
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D SPIRV-Headers_SOURCE_DIR=/usr
    -D SPIRV_TOOLS_BUILD_STATIC=OFF
    -D SPIRV_WERROR=OFF
  )

  cmake -S SPIRV-Tools -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set sw=2 sts=-1 et:
