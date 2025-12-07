# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: nut543 <kfs1@online.no>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=re2c
pkgver=4.3.1
pkgrel=1
arch=(x86_64)
pkgdesc='A tool for generating C-based recognizers from regular expressions'
url='https://re2c.org'
license=(LicenseRef-re2c)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cmake
  python
)
source=("https://github.com/skvadrik/re2c/archive/$pkgver/re2c-$pkgver.tar.gz")
sha256sums=('6963eabb99eb6ca1dd0ee37a9fa6900778c998f99f46b5ba746076d16d78300f')

build() {
  cd $pkgname-$pkgver
  # CMAKE_BUILD_TYPE=None explicitly disallowed in cmake/Re2cBuildType.cmake
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  ctest --test-dir build --output-on-failure
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
