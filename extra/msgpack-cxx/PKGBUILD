# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname='msgpack-cxx'
pkgver=6.1.0
pkgrel=1
pkgdesc='An efficient object serialization library for C++'
arch=("any")
url='https://msgpack.org/'
license=('BSL-1.0')
makedepends=('cmake' 'doxygen' 'graphviz')
depends=('boost')
source=("https://github.com/msgpack/msgpack-c/releases/download/cpp-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "LICENSE-${pkgname}-${pkgver}::https://raw.githubusercontent.com/msgpack/msgpack-c/cpp_master/COPYING")
b2sums=('14c6e28ab02957e6313a01002d05c23e2599f433656c8ea8033eb338c6e8b97d10e00a91e1e67bc3b944c3f9b46ad1ea11fc6905d50554699caeed7bd9cbc8f7'
        'f39585a8a06390e7677a46fd62c1836d2873ceb6e66927803fcbf42a572b5c6c0948b5191708bf1fe04c79b94de574d1d1ef19eaca28e81326af6ef1757c1d94')

build() {
  local cmake_args=(
    -Wno-dev
    -S "${pkgname}-${pkgver}"
    -B build
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=Release
    -D BUILD_SHARED_LIBS=ON
    -D MSGPACK_CXX17=ON
    -D MSGPACK_BUILD_EXAMPLES=OFF
    -D MSGPACK_BUILD_TESTS=ON
  )
  cmake "${cmake_args[@]}"
  cmake --build build
}

check() {
  cd build
  make test 
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${srcdir}/LICENSE-${pkgname}-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
