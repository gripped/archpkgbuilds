# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=vulkan-validation-layers
pkgver=1.4.363.1
pkgrel=1
pkgdesc="Vulkan Validation Layers"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  glibc
  libgcc
  libstdc++
  spirv-tools
)
makedepends=(
  cmake
  git
  libxrandr
  ninja
  python-lxml
  spirv-headers
  vulkan-headers
  vulkan-icd-loader
  vulkan-utility-libraries
  wayland
)
options=(
  # https://github.com/KhronosGroup/Vulkan-ValidationLayers/issues/5994
  !lto
)
groups=(vulkan-devel)
source=("git+https://github.com/KhronosGroup/Vulkan-ValidationLayers#tag=vulkan-sdk-$pkgver")
b2sums=('2476608bbae8896ff3d77f93930cf98fceb1111f94eb62e50ad29d51fab96dd104f32677327b79a5321c621c7a9f5f422d01b73693d7ff76865bc5e5f6059afb')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
  )

  cmake -S Vulkan-ValidationLayers -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir -p "$pkgdir/usr/share/doc"
  cp -a Vulkan-ValidationLayers/docs "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set sw=2 sts=-1 et:
