# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=openimagedenoise
pkgver=2.2.0
pkgrel=1
pkgdesc='Intel(R) Open Image Denoise library'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache')
depends=('intel-tbb')
makedepends=('cmake' 'ninja' 'ispc' 'python')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.src.tar.gz")
sha512sums=('dfff29e27726e930e5a47e1cc5ff129379d2ed9463f7381b5c24663b079de892000066438928e54a862c6d4e8e560217caab3f5c2969dec7cf269bbc5e99c109')

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
