# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander Susha <isushik94@gmail.com>
# Contributor: Fredrik Tegenfeldt <tegenf@gmail.com>

pkgname=xsimd
pkgver=12.1.0
pkgrel=1
pkgdesc='QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing'
arch=(any)
url='https://github.com/QuantStack/xsimd'
license=(BSD)
depends=()
makedepends=(cmake
             gtest)
source=(https://github.com/QuantStack/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('957f0097aa6baeffe63e34bbebc9fd677b98d6cdae3a74c20f1dd4aadf9f37027efdcf840670eddfd8194e255aee1e52a960ffb04b056b75bf66e38e73981818')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
