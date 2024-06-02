# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=re2
_re2ver=2024-06-01
pkgrel=1
epoch=1
pkgver=${_re2ver//-}
pkgdesc="Fast, safe, thread-friendly regular expression engine"
arch=('x86_64')
url="https://github.com/google/re2"
license=('BSD-3-Clause')
depends=('gcc-libs' 'abseil-cpp')
checkdepends=('gtest' 'benchmark')
provides=('libre2.so')
source=(re2-$pkgver.tar.gz::https://github.com/google/re2/archive/$_re2ver.tar.gz)
sha256sums=('7326c74cddaa90b12090fcfc915fe7b4655723893c960ee3c2c66e85c5504b6c')

build() {
  cd $pkgname-$_re2ver
  make
}

check() {
  cd $pkgname-$_re2ver
  make test
}

package() {
  cd $pkgname-$_re2ver
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
