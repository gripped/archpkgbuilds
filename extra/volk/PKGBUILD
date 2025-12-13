# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=volk
pkgver=1.4.335.0
pkgrel=1
pkgdesc="Meta loader for Vulkan API"
url="https://github.com/zeux/volk"
arch=(x86_64)
license=(MIT)
makedepends=(
  cmake
  git
  ninja
  vulkan-headers
)
groups=(vulkan-devel)
options=(
  # We are producing static libraries
  !lto
)
source=("git+$url#tag=vulkan-sdk-$pkgver")
b2sums=('5d6c2425a29da0cc865cdc276ce083094a24591258091091f777cdc5064d1707c65b8da0102a3d4a6793b3e998ad90b75ca6d8e915d7dd05733f9a5e49302e72')

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D VOLK_INSTALL=ON
  )

  cmake -S volk -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 volk/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
