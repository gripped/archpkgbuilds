# Maintainer: Santiago Torres <sangy@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=uncrustify
pkgver=0.82.0
pkgrel=1
pkgdesc="A source code beautifier"
arch=(x86_64)
url="https://github.com/uncrustify/uncrustify"
license=(GPL-2.0-only)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cmake
  python
)
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('e05f8d5ee36aaa1acfa032fe97546b7be46b1f4620e7c38037f8a42e25fe676f')

build() {
  cmake -S $pkgname-$pkgname-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd $pkgname-$pkgname-$pkgver
  install -vDm644 -t "$pkgdir/usr/share/uncrustify" etc/*.cfg
}
