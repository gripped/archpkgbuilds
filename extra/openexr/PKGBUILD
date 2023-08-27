# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=openexr
pkgver=3.1.11
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64)
license=(BSD)
depends=(zlib imath)
makedepends=(cmake)
source=(https://github.com/openexr/openexr/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('06b4a20d0791b5ec0f804c855d320a0615ce8445124f293616a086e093f1f1e1')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
