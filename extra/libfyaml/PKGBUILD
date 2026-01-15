# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9.3
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/pantoniou/libfyaml#tag=v$pkgver)
sha256sums=('ff9f7b7defe589dda095a4796fdeb098bbd3886242bc573a6ed5b65014f4e7b0')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
