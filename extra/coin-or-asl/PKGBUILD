# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=coin-or-asl
pkgver=2.1.1
pkgrel=1
pkgdesc='COIN-OR autotools harness to build AMPL Solver Library'
arch=(x86_64)
url='https://github.com/coin-or-tools/ThirdParty-ASL/'
license=(EPL-2.0)
groups=(coin-or)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/coin-or-tools/ThirdParty-ASL#tag=releases/$pkgver
        https://coin-or-tools.github.io/ThirdParty-ASL/solvers-64919f75f.tgz)
sha256sums=('f4417ef98003a8346a0f5d12836ebe0820c6c05a5a2b56deae98be490672e60d'
            'e212926d1d797701adc901ef18eaab6b15edd13f9281dd8c9266e3cdaf8c2dd3')

prepare() {
  cd ThirdParty-ASL
  ln -s ../solvers .
}

build() {
  cd ThirdParty-ASL
  ./configure --prefix=/usr --srcdir="$PWD"
  make
}

package() {
  cd ThirdParty-ASL
  make DESTDIR="$pkgdir" install
}
