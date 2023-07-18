# Maintainer: Anatol Pomozov

pkgname=aws-c-common
pkgver=0.8.23
pkgrel=1
pkgdesc='Core c99 package for AWS SDK for C. Includes cross-platform primitives, configuration, data structures, and error handling.'
arch=(x86_64)
url='https://github.com/awslabs/aws-c-common'
license=(Apache)
depends=(glibc)
makedepends=(cmake)
source=(aws-c-common-$pkgver.zip::https://github.com/awslabs/aws-c-common/archive/v$pkgver.zip)
sha256sums=('4cd9c9dbe334aec588df3588f396b0b8812860416df7cdf075486d6a6e5dd0d7')

build() {
  cd aws-c-common-$pkgver

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -S . -B build
  cmake --build build
}

check() {
  cd aws-c-common-$pkgver
  cmake --build build --target test
}

package() {
  cd aws-c-common-$pkgver

  cmake --build build --target install -- DESTDIR="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
