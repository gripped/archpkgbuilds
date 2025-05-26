# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.40.0
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
sha512sums=('d842b541cf980f3bc1b3b9b50a3a973e473d760a4cf59b8832ea20846870c9560a179b0c98999fcb03bc96449dc7421ff359e9fb3abaf764f6549dd46800b89a')
b2sums=('8e82707c3153923eaa18525f63d57dc9e04c71bac55cea169772dcad4993eeb048f0a5f92477ae0457d49a177fb7085b8d09d3b5b50aeb056152776a2d545424')

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
