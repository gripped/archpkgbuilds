# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libindi
pkgver=2.1.3
pkgrel=1
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
         libjpeg-turbo
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
sha256sums=('f770e77ee30eb8dfd55a27dccf1329300f42df5cf4d1c6f71ac89940cf6a64ad')

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
