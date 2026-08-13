# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.42.0
pkgrel=1
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# bundled: xxhash, mimalloc
depends=(
  glibc
  libblake3
  libstdc++
  tbb
  zlib
  zstd
)
makedepends=(
  cmake
  ninja
  git
  mold
  python
)
checkdepends=(
  clang
  libdwarf
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('9a98c76e0e8a06831f8389c216dec3f332dc4bf713252daf3b6d1442553e282a932452b45e517605c81a81013493ffb6fb00d12dabb6b4c1373f24da81169204')
b2sums=('090c6bd2f6e4332b97b18aece1ce81a0b269af8a8383c143d929411bee77f870698c9df3057aef9fd556dc9eac809ab91779bfb875d96c11d28273c0569ca89d')

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBEXECDIR=lib
    -D MOLD_USE_SYSTEM_MIMALLOC=OFF
    -D MOLD_USE_SYSTEM_TBB=ON
    -D MOLD_LTO=ON
    -D MOLD_USE_MOLD=ON
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname/LICENSE"
}
