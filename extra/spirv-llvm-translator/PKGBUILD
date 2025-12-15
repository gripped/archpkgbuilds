# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=spirv-llvm-translator
pkgver=21.1.3
pkgrel=1
pkgdesc="LLVM <-> SPIR-V converter for compilers targeting SPIR-V"
url="https://www.khronos.org/spirv/"
arch=(x86_64)
license=(NCSA)
depends=(
  gcc-libs
  glibc
  llvm-libs
  spirv-tools
)
makedepends=(
  cmake
  git
  llvm
  ninja
  spirv-headers
)
checkdepends=(
  clang
  python
)
source=(
  git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator#tag=v$pkgver
)
b2sums=('7f99ace2560e2778f0621e6b586973a37269beb2c77151b149c2bab47a53668dcfcfb00e46dc868a4b8137eebd00332b2e62e40ec091e71e811e8d0dc9f3b541')

prepare() {
  cd SPIRV-LLVM-Translator

  # Fix tests
  # https://github.com/KhronosGroup/SPIRV-LLVM-Translator/pull/3301
  git cherry-pick -n fc5873ee760c333738c9e8e8d8c2eb906f0c40f5
}

build() {
  local cmake_options=(
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_SKIP_RPATH=ON
    -D LLVM_CONFIG=llvm-config
    -D LLVM_EXTERNAL_LIT=/usr/bin/lit
    -D LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv
    -D LLVM_LIBDIR_SUFFIX=
    -D LLVM_SPIRV_ENABLE_LIBSPIRV_DIS=ON
    -D LLVM_SPIRV_INCLUDE_TESTS=ON
    -W no-dev
  )

  cmake -S SPIRV-LLVM-Translator -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

check() {
  # Does not use ctest-compatible targets
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 SPIRV-LLVM-Translator/LICENSE.TXT \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
