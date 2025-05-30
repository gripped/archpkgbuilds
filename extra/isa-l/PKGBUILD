# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=isa-l
pkgver=2.31.1
pkgrel=2
pkgdesc="Intelligent Storage Acceleration Library"
arch=(x86_64)
url="https://github.com/intel/isa-l"
license=('BSD-3-Clause')
depends=(glibc)
makedepends=(
  help2man
  nasm
)
provides=(libisal.so)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e1d5573a4019738243b568ab1e1422e6ab7557c5cae33cc8686944d327ad6bb4')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

check() {
  cd $pkgname-$pkgver
  make check
  make tests
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
