# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=openimagedenoise
pkgver=2.2.1
pkgrel=1
pkgdesc='Intel(R) Open Image Denoise library'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache')
depends=('intel-tbb')
makedepends=('cmake' 'ninja' 'ispc' 'python')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.src.tar.gz")
sha512sums=('0aa21f0862d8f165b2a1305e97cabbe5f86ecfe003a8464f7cf1c6b7d2644a9fc8a26d9b067e51497f26c928716ba92dbf42c0c156e72c630a706eaf463a5c31')

build() {
  cd oidn-$pkgver

  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

package() {
  cd oidn-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
