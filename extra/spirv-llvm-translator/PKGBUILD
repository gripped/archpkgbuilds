# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=spirv-llvm-translator
pkgver=22.1.1
pkgrel=1
pkgdesc="LLVM <-> SPIR-V converter for compilers targeting SPIR-V"
url="https://www.khronos.org/spirv/"
arch=(x86_64)
license=(NCSA)
depends=(
  glibc
  libstdc++
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
b2sums=('b01e8c577814ea0b0a80fb4ec3d9d0b5fef21278a22ed6cc702f10186a132c1fda70ad3c8a4236d5116f7334ed209645c97cc7259818d8b79fa27fb027536a66')

prepare() {
  cd SPIRV-LLVM-Translator

  # Fix tests
  # https://github.com/KhronosGroup/SPIRV-LLVM-Translator/pull/3301
  # https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/3580
  git cherry-pick -n fc5873ee760c333738c9e8e8d8c2eb906f0c40f5
  git cherry-pick -n 30258ee35493b5355a5c6df0655f91eff4217685
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
