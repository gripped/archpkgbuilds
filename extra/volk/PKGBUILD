# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=volk
pkgver=1.4.304.1
pkgrel=2
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
b2sums=('bd72a8855c72297527d3807c3c7e8bc033e0fd91505ff6436d8e7a0e7a773e7a60e44175d9890bd1bfb38d30b514a22cc1f1fe6674823bf00fb79ed09ea1e41d')

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
