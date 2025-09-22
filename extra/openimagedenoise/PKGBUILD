# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=openimagedenoise
pkgver=2.3.3
pkgrel=3
pkgdesc='Intel(R) Open Image Denoise library'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache-2.0')
depends=('intel-tbb')
makedepends=('cmake' 'ninja' 'ispc' 'python' 'cuda' 'hip-runtime-amd')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.src.tar.gz"
        0001-Fix-build-with-CUDA-13.patch)
sha512sums=('0d05f751d6d793c0e825548feb586a58a7bba7ef8a8002db993aec7a31a6bcae6fe3d98c0ea4040d2378edc619220fa07dc6d43d08a9371f1e6e9e45eae19906'
            '2fd8c9e3b71eee126e4cc631fc22517f458bc90fa74d6a1ebeaab9962c1dd0f2b2cbdc2cf58ea0165cd2fed7707260c79970eeeb2ac6535b9912bc297991cab9')

prepare() {
  cd oidn-$pkgver
  # Fix build with CUDA 13 https://github.com/RenderKit/oidn/issues/274
  patch -p1 < ../0001-Fix-build-with-CUDA-13.patch
}

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
