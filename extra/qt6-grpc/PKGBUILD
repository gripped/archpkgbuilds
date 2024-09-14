# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-grpc
pkgver=6.7.2
pkgrel=4
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Provides the modules QtGrpc and QtProtobuf'
depends=(abseil-cpp
         gcc-libs
         glibc
         protobuf
         qt6-base)
makedepends=(cmake
             git
             grpc
             ninja)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver)
sha256sums=('63fd4f51dcfad8ebd18c653423c1d62138a30a8ef339562328e555c55b79d163')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
