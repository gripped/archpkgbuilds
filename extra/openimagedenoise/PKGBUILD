# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=openimagedenoise
pkgver=2.5.1
pkgrel=2
pkgdesc='Intel(R) Open Image Denoise library'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache-2.0')
depends=('intel-tbb' 'glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'ninja' 'ispc' 'python' 'cuda' 'hip-runtime-amd')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.src.tar.gz")
sha512sums=('fee6ff6d8b0b496965ef805e9aa009a087122e26151ef34e0147d7c60fbb8edffb2492d7d0a02ad66e2dec6fd5bbd788598f453936f155e66a4016d7ed858ee3')

build() {
  cd oidn-$pkgver

  export CXXFLAGS+=" -fcf-protection=none"

  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOIDN_DEVICE_CUDA=ON \
    -DOIDN_DEVICE_HIP=ON \
    -DOIDN_DEVICE_HIP_COMPILER=/opt/rocm/lib/llvm/bin/clang++ \
    -DCMAKE_BUILD_TYPE=Release
  ninja -C build
}

package() {
  cd oidn-$pkgver
  DESTDIR="$pkgdir" ninja -C build install

  rm -r "${pkgdir}"/build
}
