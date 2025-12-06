# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Baris Demirdelen <barisdemirdelen at gmail dot com>
# Contributor: Andrew Anderson <aanderso@tcd.ie>
# Contributor: Jonathon Fernyhough <jonathon_at manjaro_dotorg>
pkgname=onednn
pkgver=3.10.2
pkgrel=1
pkgdesc="oneAPI Deep Neural Network Library (oneDNN)"
arch=(x86_64)
replaces=('intel-dnnl' 'mkl-dnn')
provides=('intel-dnnl' 'mkl-dnn')
url=https://github.com/oneapi-src/oneDNN
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oneapi-src/oneDNN/archive/v${pkgver}.tar.gz")
sha256sums=('58a7399c86789bf3756117072ed946d764ba59dd1480f0e42efd4f9b6b7b9a64')

build() {
  cd "oneDNN-$pkgver"
  cmake \
      -Bbuild \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX="/usr"
  ninja -C build
}

check() {
  cd "oneDNN-$pkgver/build"
  ctest
}

package() {
  cd "oneDNN-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
