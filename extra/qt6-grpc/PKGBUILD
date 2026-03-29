# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-grpc
_pkgver=6.11.0
pkgver=${_pkgver/-/}
pkgrel=2
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Provides the modules QtGrpc and QtProtobuf'
depends=(abseil-cpp
         gcc-libs
         glibc
         protobuf
         qt6-base)
makedepends=(cmake
             git
             grpc
             ninja
             qt6-declarative)
optdepends=('qt6-declarative: QML bindings')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('71c65df0cff00efe0f357be3a665b626ca4aab3f7baf3ffb0ac92efee14753aa')

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
