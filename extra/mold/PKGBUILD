# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.41.0
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
sha512sums=('31e144aa8cbee09663fc7ba261a578f9fddcc59baeb64371481bb0e0fb3eddecb9dbfb7286208683b60f94cdd3737d2f47e14c794eb5832eac1eca52b782995b')
b2sums=('93a584d1e1ce7030c2b6d88f4d9da2786a6d60dc77c11a25350cf5e6d77bd379098c8a3129b281f134d4ea8dd74dd79af1139cdf8373a73a619ba3822754cd7d')

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
