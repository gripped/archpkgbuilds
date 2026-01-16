# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=opencl-clhpp
pkgver=2025.07.22
pkgrel=1
pkgdesc='OpenCL C++ header files'
arch=('any')
url='https://github.com/KhronosGroup/OpenCL-CLHPP'
license=('Apache-2.0')
makedepends=('cmake' 'doxygen' 'graphviz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/OpenCL-CLHPP/archive/v${pkgver}.tar.gz")
sha256sums=('c1031afde6e9eb042e6fcfbc17078f4b437a7e8d55482a1ca6e0fa762d262a89')
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
