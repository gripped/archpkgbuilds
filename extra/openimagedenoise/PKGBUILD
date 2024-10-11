# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=openimagedenoise
pkgver=2.3.0
pkgrel=2
pkgdesc='Intel(R) Open Image Denoise library'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache-2.0')
depends=('intel-tbb')
makedepends=('cmake' 'ninja' 'ispc' 'python' 'cuda' 'hip-runtime-amd')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.src.tar.gz")
sha512sums=('4f68ce3b0da37e1861090d60d7cd823046f325c45a8e2c3f4098eb3b4f7ec676d2acbb9c138ff60a9f83188dd0dcbaba42106aad96beafc5e65045c77c00f2f8')

build() {
  cd oidn-$pkgver

  export CXXFLAGS+=" -fcf-protection=none"

  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOIDN_DEVICE_CUDA=ON \
    -DOIDN_DEVICE_HIP=ON \
    -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

package() {
  cd oidn-$pkgver
  DESTDIR="$pkgdir" ninja -C build install

  rm -r "${pkgdir}"/build
}
