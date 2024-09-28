# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-shadertools
pkgver=6.7.3
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3)
pkgdesc='Provides functionality for the shader pipeline that allows Qt Quick to operate on Vulkan, Metal, and Direct3D, in addition to OpenGL'
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake
             git
             ninja)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver)
sha256sums=('bb80a3bae6182cfbdb2846c311bf10227887a497d71b7ff678db9929d94e921b')

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
