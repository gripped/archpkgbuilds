# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=opencl-clhpp
pkgver=2024.10.24
pkgrel=1
pkgdesc='OpenCL C++ header files'
arch=('any')
url='https://github.com/KhronosGroup/OpenCL-CLHPP'
license=('Apache-2.0')
makedepends=('cmake' 'doxygen' 'graphviz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/OpenCL-CLHPP/archive/v${pkgver}.tar.gz")
sha256sums=('51aebe848514b3bc74101036e111f8ee98703649eec7035944831dc6e05cec14')
depends=('opencl-headers')

build() {
  cmake -B build -S OpenCL-CLHPP* \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=Off \
    -DBUILD_DOCS=On \
    -DBUILD_TESTING=Off 

  make -C build docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
  cp -r build/docs/html/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
  install -D -m644 OpenCL-CLHPP*/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
