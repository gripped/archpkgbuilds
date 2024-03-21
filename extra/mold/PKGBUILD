# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

pkgname=mold
pkgver=2.30.0
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
b2sums=('715b6b7d210773e480edcb6e4ce3eb652bde65ae514870431c2f78c325bf7454e2108b557228d2c3d3b6d339ec31280aef2a6a15efa7c517f357a5408cc4b8bd')

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
