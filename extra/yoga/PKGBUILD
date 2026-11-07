# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=yoga
pkgver=3.2.2
pkgrel=1
pkgdesc="Cross-platform layout engine"
arch=('x86_64')
url="https://github.com/facebook/yoga"
license=('MIT')
depends=('libgcc' 'glibc' 'libstdc++')
makedepends=('cmake' 'git' 'ninja')
checkdepends=('gtest')
source=("git+https://github.com/facebook/yoga.git#tag=v$pkgver")
sha512sums=('c7d20a34b276ff02e82ece8bb9e0200587e5a30e2b177561eaa4d77d0b1c13a7f006a9b7659e08aeb369320c7079a74f7ab7ff85bb9476b4a2d10a9c8ffd3db0')

prepare() {
  cd yoga
  # Use system gtest instead of fetching
  sed -i '/include(FetchContent)/d; /FetchContent_Declare/,/FetchContent_MakeAvailable/d; s/include(GoogleTest)/include(GoogleTest)\nfind_package(GTest REQUIRED)/' tests/CMakeLists.txt
  # Build shared library
  sed -i 's/add_library(yogacore STATIC/add_library(yogacore SHARED/' yoga/CMakeLists.txt
}

build() {
  cmake -S yoga -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_FUZZ_TESTS=OFF
  cmake --build build
}

check() {
  cd build
  ./tests/yogatests
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 yoga/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
