# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libindi
pkgver=2.0.8
pkgrel=2
pkgdesc='A distributed control protocol designed to operate astronomical instrumentation'
url='https://www.indilib.org/index.php?title=Main_Page'
license=(LGPL-2.1-only)
arch=(x86_64)
depends=(cblas
         cfitsio
         curl
         fftw
         gcc-libs
         glibc
         gsl
         libev
         libjpeg
         libnova
         libogg
         libtheora
         libusb
         libxisf
         rtl-sdr
         zlib)
makedepends=(cmake
             git
             qt5-base)
optdepends=('qt5-base: Qt client library')
source=(git+https://github.com/indilib/indi#tag=v$pkgver)
sha256sums=('c6d435566800eee5cde3e31126c33dc66e845cdb0ff5ad5b2391c2a0e0898fb2')

build() {
  cmake -B build -S indi \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINDI_BUILD_QT5_CLIENT=ON \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects -Wp,-U_GLIBCXX_ASSERTIONS"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
