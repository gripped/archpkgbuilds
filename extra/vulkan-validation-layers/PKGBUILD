# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=vulkan-validation-layers
pkgver=1.4.335.0
pkgrel=1
pkgdesc="Vulkan Validation Layers"
url="https://www.vulkan.org/"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
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
b2sums=('3af448fe26b1e3039b98463b16a0580154c9b6dbac16881e15549ec41beb7bcc923952d139b0d9cde8f6a235bceb0721556947b9e3d474307e06f89975372da9')

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
