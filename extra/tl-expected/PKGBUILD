# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Viktor Schneider <info[at]vjs[dot]io>
pkgname=tl-expected
pkgver=1.2.0
pkgrel=1
pkgdesc="C++11/14/17 std::expected with functional-style extensions"
arch=('any')
url="https://github.com/TartanLlama/expected"
license=('CC0-1.0')
makedepends=('cmake' 'git' 'ninja')
source=("expected-v${pkgver}.tar.gz::https://github.com/TartanLlama/expected/archive/v${pkgver}.tar.gz")
sha256sums=('f5424f5fc74e79157b9981ba2578a28e0285ac6ec2a8f075e86c41226fe33386')

build() {
  cd "expected-$pkgver"

  cmake \
      -B build \
      -G Ninja \
      -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build
}

package() {
  cd "expected-$pkgver"

  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
