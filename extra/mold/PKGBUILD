# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.34.1
pkgrel=1
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# xxhash is bundled
depends=('glibc' 'gcc-libs' 'mimalloc' 'zlib' 'tbb' 'zstd')
makedepends=('git' 'python' 'cmake' 'mold')
checkdepends=('clang' 'libdwarf')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha512sums=('1d0820074b2c83661df5d208bbbf235622298425174fd228879b39777b185b47ac220c1e268fdbc3d11c266f0cc06a507d784491464cfa59aa6b4e0d1830c548')
b2sums=('5914d23a851c2e2173c20124f256104720da7f1a96f1e3509d4c725215e4b928de614ee5a678ff3bd67aac0189f534b269fb9854381e157d222ac3970572b634')

build() {
  cmake \
  -S "$pkgname" \
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
  DESTDIR="$pkgdir" cmake --install build
}
