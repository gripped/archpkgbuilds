# Maintainer: Bert Peters <bertptrs@archlinux.org>
pkgname=simdjson
epoch=1
pkgver=4.6.6
pkgrel=1
pkgdesc="A C++ library to see how fast we can parse JSON with complete validation."
arch=('x86_64')
url="https://github.com/simdjson/simdjson"
license=('Apache-2.0')
depends=(
  libgcc
  libstdc++
)
# This package should makedepend on cxxopts to build the tools, but that doesn't
# work regardless so we skip it.
makedepends=(
  cmake
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/simdjson/simdjson/archive/v$pkgver.tar.gz"
)
sha256sums=('1cd4c4c18263d2ae1f0cd5d4ba8b14e679b5a419ca15988a0da4cf43c514f28d')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DBUILD_SHARED_LIBS='On' \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCPM_USE_LOCAL_PACKAGES='On' \
    -DSIMDJSON_DEVELOPER_MODE='On' \
    -DSIMDJSON_ALLOW_DOWNLOADS='Off' \
    -Wno-dev

  cmake --build build
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel $(nproc)
    # exclude problematic tests
    --exclude-regex "$excluded_tests"
  )

  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir/" cmake --install build
}

# vim: tabstop=2 shiftwidth=2 expandtab:
