# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=spirv-tools
pkgver=1.4.341.0
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
b2sums=('9dba10905284c9d57bf5873c9712eaa224deb2f473aa49c88e80b1a0c62430c5b11fe65662b5ff9bd6e852cbbac7fe4f7402abb87caae9a4a2b60d4d7e9d1aa1')

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
