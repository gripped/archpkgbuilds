# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=volk
pkgver=1.4.313.0
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
b2sums=('a095c8ce7ce5c9cec5b14b797ab85533e7051dde5c1b3906d872ec20d44ec0598ae0579f3150b68dd164b9a59155336534b02ed4e0b90e64248b0b9ade0a7cef')

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
