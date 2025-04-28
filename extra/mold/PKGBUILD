# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.38.1
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
sha512sums=('22e41cfe792a2c94a30f8d4da410a54433066193494d0a802970959dde262b64b640a2c11f74f4be466f2eedfb13548e9a99821b6eefb48f4aced9db404213c4')
b2sums=('386274241ecfc33036a54f56fafdf3b4cd316c9c0d4a0c3f5ffd80a822932177ef4ce0821ff7572e2dd1242c6c021b125920acff7b99d52298effd298ba483f4')

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
