# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt6-grpc
_pkgver=6.9.0
pkgver=${_pkgver/-/}
pkgrel=1
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
sha256sums=('54dfa5eaff3035674b19bb04cd22c0470767bf8d6b6a8438d39a4dcad0ac0f8f')

prepare() {
  cd $_pkgfn
  git cherry-pick -n 01b1e9df8cb74bb404ca5b651dc4fc8dfbd1419c # Fix build with protobuf 30
}

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
