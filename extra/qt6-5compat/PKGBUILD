# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt6-5compat
pkgver=6.7.3
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Module that contains unsupported Qt 5 APIs'
depends=(gcc-libs
         glibc
         icu
         qt6-base
         qt6-shadertools)
makedepends=(cmake
             git
             ninja
             qt6-declarative
             qt6-shadertools)
optdepends=('qt6-declarative: for QtGraphicalEffects')
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$pkgver)
sha256sums=('5764c228cc23c426f0f4221a75352e366599e7f8b5f40b6aaadf36b40de6cd53')

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
