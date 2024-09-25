# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.34.0
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
b2sums=('e0ca58f8e354d4a6bb7959105f4be54d733fea5a760762d0f0d75d1a5de635a8a2ddc49d962ffbb9286846dc72dbacbc9c5395798822a4daf5d04c32890e928e')

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
