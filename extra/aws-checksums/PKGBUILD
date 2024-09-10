# Maintainer: Anatol Pomozov
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=aws-checksums
pkgver=0.1.19
pkgrel=1
pkgdesc='Cross-Platform HW accelerated CRC32c and CRC32 with fallback to efficient SW implementations.'
arch=(x86_64)
url='https://github.com/awslabs/aws-checksums'
license=(Apache-2.0)
depends=(
  aws-c-common
  glibc
)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('844e5a4f659f454112c559d4f4043b7accfbb134e47a55f4c55f79d9c71bdab1')

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  cmake --build build --target test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
