# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libdispatch
pkgver=6.1
pkgrel=1
pkgdesc='Comprehensive support for concurrent code execution on multicore hardware'
arch=('x86_64')
url=https://apple.github.io/swift-corelibs-libdispatch
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'clang' 'cmake' 'ninja')
provides=('libblocksruntime')
source=("${pkgname}::git+https://github.com/apple/swift-corelibs-libdispatch.git#tag=swift-${pkgver%.0}-RELEASE"
        'remove-werror.patch')
sha512sums=('56c6599dfd10f919ab0e6c7152f32d54b2f95b972acd39d2a5355e63d6b9e5d532d0fa987f62f4c6aee37f414ad395f5aec1d06a4a288e475e1bd8b3186ac699'
            'd7d05ff6fa2ece40fea51e97f1af04e25ae9c2b55246fa2d753c446cff380262e611f9abb5112b7c7c94730362f0d06e0ccd867477c9470d1154e9c65e540529')

prepare () {
  cd "${pkgname}"
  patch -p0 < "${srcdir}/remove-werror.patch"
}

build () {
  cd "${pkgname}"
  export CC=clang
  export CXX=clang
  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBlocksRuntime_INCLUDE_DIR=/usr/include \
    -DBlocksRuntime_LIBRARIES=/usr/lib/libBlocksRuntime.so
  ninja -C build
}

check () {
  cd "${pkgname}"
  ninja -C build test
}

package () {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
