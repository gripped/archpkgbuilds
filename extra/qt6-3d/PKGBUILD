# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-3d
_pkgver=6.8.3
pkgver=${_pkgver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='C++ and QML APIs for easy inclusion of 3D graphics'
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(assimp
             cmake
             git
             ninja
             qt6-declarative
             qt6-shadertools)
optdepends=('assimp: assimp importer plugin'
            'qt6-declarative: QML bindings'
            'qt6-shadertools: RHI renderer')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('dec55a5fabcdd80d63679a2160c25d099e94df9332d1ad2282638c871e1605ac')

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
