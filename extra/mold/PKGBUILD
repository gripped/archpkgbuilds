# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.3.2
pkgrel=1
_commit='edc2f852a1f893be2cb824a6832d0f48d4680910'
pkgdesc='A Modern Linker'
arch=('x86_64')
url='https://github.com/rui314/mold'
license=('MIT')
# xxhash is bundled
depends=('glibc' 'gcc-libs' 'mimalloc' 'zlib' 'tbb' 'zstd')
makedepends=('git' 'python' 'cmake' 'mold')
checkdepends=('clang' 'libdwarf')
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

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
