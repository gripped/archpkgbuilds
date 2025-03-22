# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=volk
pkgver=1.4.309.0
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
b2sums=('909e068b72000daefb34493b620c77c250aa13012ba0057ac1e36bb32c47c0e495996288cb1b067bb5890f110be6d377050ead31adf6651e74ea7272a329e5a1')

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
