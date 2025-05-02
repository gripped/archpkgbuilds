# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkg=orc
pkgname=apache-${_pkg}
pkgver=2.0.3
pkgrel=6
pkgdesc="Columnar storage for Hadoop workloads."
arch=(x86_64)
url="https://orc.apache.org"
license=(Apache)
depends=(lz4 protobuf snappy zlib zstd)
makedepends=(cmake git)
checkdepends=(gtest)
source=(${pkgname}::git+https://github.com/apache/orc.git#tag=v${pkgver})
sha256sums=('fbafce5090b9fe12993b83a7f9f585a501e5ec709d1ec7319acc260ad448d06a')
validpgpkeys=(F28C9C925C188C35E345614DEDA00CE834F0FC5C  # Dongjoon Hyun (CODE SIGNING KEY) <dongjoon@apache.org>
              AA94E2A8F0A0B7167305C5232D9F6201DECDFA29) # William Hyun (CODE SIGNING KEY) <william@apache.org>

prepare(){
  cd ${pkgname}
  sed -i 's/orc STATIC/orc SHARED/' c++/src/CMakeLists.txt
  # Fix build with protobuf 27
  sed -e 's|PROTOBUF_INCLUDE_DIR protobuf::libprotoc|PROTOBUF_INCLUDE_DIR protobuf::libprotobuf|' -i cmake_modules/FindProtobuf.cmake
}

build(){
  cmake -B build -S ${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DSTOP_BUILD_ON_WARNING=OFF \
    -DLZ4_HOME="/usr" \
    -DPROTOBUF_HOME="/usr" \
    -DSNAPPY_HOME="/usr" \
    -DZLIB_HOME="/usr" \
    -DZSTD_HOME="/usr" \
    -DGTEST_HOME="/usr" \
    -DORC_PREFER_STATIC_PROTOBUF=OFF \
    -DORC_PREFER_STATIC_SNAPPY=OFF \
    -DORC_PREFER_STATIC_LZ4=OFF \
    -DORC_PREFER_STATIC_ZSTD=OFF \
    -DORC_PREFER_STATIC_ZLIB=OFF \
    -DBUILD_LIBHDFSPP=OFF \
    -DBUILD_JAVA=OFF \
    -DINSTALL_VENDORED_LIBS=OFF \
    -Wno-dev
  cmake --build build
}

check(){
  # Some tests failures https://github.com/apache/orc/issues/1068
  make -C build test-out || echo "Warning: Tests failed"
}

package(){
  DESTDIR="${pkgdir}" cmake --install build
}
