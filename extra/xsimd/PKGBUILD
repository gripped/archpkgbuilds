# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander Susha <isushik94@gmail.com>
# Contributor: Fredrik Tegenfeldt <tegenf@gmail.com>

pkgname=xsimd
pkgver=14.2.0
pkgrel=1
pkgdesc='QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing'
arch=(any)
url='https://github.com/QuantStack/xsimd'
license=(BSD-3-Clause)
depends=()
makedepends=(cmake
             git
             gtest)
source=(git+https://github.com/QuantStack/$pkgname#tag=$pkgver)
sha512sums=('1e508ef43ad09fcbbcbb902c28aa792e853fde96e51717d3d7a0ae8bd1a4f2ac8106840d13e64deb75c1f0fb3e0b5c19e2cd6422125e0f2874d2d38aa9a9f58d')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
