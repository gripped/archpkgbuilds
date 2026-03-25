# Maintainer: Santiago Torres <sangy@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=uncrustify
pkgver=0.82.0
pkgrel=2
pkgdesc="A source code beautifier"
arch=(x86_64)
url="https://github.com/uncrustify/uncrustify"
license=(GPL-2.0-only)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  cmake
  python
)
source=("$url/archive/$pkgname-$pkgver.tar.gz")
b2sums=('40c114c67082bde40439a5a203396a4458e26eeb531dfc6b5f74d8ce239554219d79189a848ff2fd1ad37f7d2c70494c0ce9bbc0b5489bae382e30a6a482696d')

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
