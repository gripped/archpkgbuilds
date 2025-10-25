# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Baris Demirdelen <barisdemirdelen at gmail dot com>
# Contributor: Andrew Anderson <aanderso@tcd.ie>
# Contributor: Jonathon Fernyhough <jonathon_at manjaro_dotorg>
pkgname=onednn
pkgver=3.9.2
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
sha256sums=('2a4495e7070a8fcb4366b5a82ff1ca098d8526a6f127ae864aa1ca4bebeae125')

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
