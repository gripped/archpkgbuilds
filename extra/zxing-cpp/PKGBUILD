# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=zxing-cpp
pkgver=3.0.1
pkgrel=1
pkgdesc='An open-source, multi-format linear/matrix barcode image processing library implemented in C++'
arch=(x86_64)
url='https://github.com/zxing-cpp/zxing-cpp'
license=(Apache-2.0)
depends=(gcc-libs
         glibc
         zint)
makedepends=(cmake
             git
             libpng
             opencv
             qt6-base
             qt6-declarative
             qt6-multimedia
             stb)
checkdepends=(gtest)
optdepends=('qt6-multimedia: for ZXingQtCamReader')
source=(git+https://github.com/zxing-cpp/zxing-cpp#tag=v$pkgver
        system-stb.patch)
sha256sums=('84c9513e0fb8127b172ddb85c4c15e5556e6facc2eeed7ebf36346f77214ee79'
            'cc83c917902c3551ff0a4b7752baf895044d40901eba74678aeef19e236266f1')

prepare() {
  cd $pkgname
  patch -p1 -i ../system-stb.patch # Do not download stb at build time
}

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DZXING_EXAMPLES=ON \
    -DZXING_EXAMPLES_QT=ON \
    -DZXING_UNIT_TESTS=ON \
    -DZXING_C_API=ON \
    -DZXING_USE_BUNDLED_ZINT=OFF \
    -DZXING_WRITERS=BOTH
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
