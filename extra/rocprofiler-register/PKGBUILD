# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>
pkgname=rocprofiler-register
pkgver=6.4.0
pkgrel=1
pkgdesc='Helper library for the ROCprofiler (v2) library'
arch=('x86_64')
url='https://github.com/ROCm/rocprofiler-register'
license=('MIT')
depends=('rocm-core' 'glibc' 'gcc-libs' 'fmt' 'google-glog')
makedepends=('cmake' 'rocm-cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rocm-$pkgver.tar.gz")
sha256sums=('7439d789f722971b2dd2f8e7b5c5cbdb1522e47a6fbb428fd9bcb24234c6fd48')
_dirname="$(basename "$url")-$(basename "${source[0]}" ".tar.gz")"

prepare() {
  # Remove cpack packaging
  sed -i '116d' "$srcdir/$_dirname/CMakeLists.txt"
  # find_package() calls on global scope
  sed -i 's/add_subdirectory(external)/find_package(fmt REQUIRED)\nfind_package(glog REQUIRED)/' \
    "$srcdir/$_dirname/CMakeLists.txt"
}

build() {
  local cmake_args=(
    -Wno-dev
    -S "$_dirname"
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/opt/rocm
    -D ROCPROFILER_REGISTER_BUILD_GLOG=OFF
    -D ROCPROFILER_REGISTER_BUILD_FMT=OFF
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
