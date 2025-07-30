# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.40.3
pkgrel=1
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# xxhash is bundled
depends=(
  glibc
  gcc-libs
  libblake3
  mimalloc
  tbb
  zlib
  zstd
)
makedepends=(
  cmake
  git
  mold
  python
)
checkdepends=(
  clang
  libdwarf
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('3ff01a652f5e1eaff68c5facc5bcb243c7bf98f5c9df0e085fdc0c18a1edcd9cb82819f65f0d279911373c41ff362be4d7fe1841a50da125489ffb4c23ce5989')
b2sums=('9daf06e64986a7f1c4589681611d82ff0d7f226c8d6d45227cec080c195e8d538dd99ae3b54779e55d6f7509ea875fac9fe701b54710abc7c45e84f5be6a129e')

build() {
  cmake \
  -S "${pkgname}" \
  -B build \
  -D CMAKE_BUILD_TYPE='None' \
  -D CMAKE_INSTALL_PREFIX='/usr' \
  -D CMAKE_INSTALL_LIBEXECDIR='lib' \
  -D MOLD_USE_SYSTEM_MIMALLOC=ON \
  -D MOLD_USE_SYSTEM_TBB=ON \
  -D MOLD_LTO=ON \
  -D MOLD_USE_MOLD=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/mold/LICENSE
}
