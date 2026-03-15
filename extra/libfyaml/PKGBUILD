# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9.6
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/pantoniou/libfyaml#tag=v$pkgver)
sha256sums=('6e3066fc231e83fe7899c3ccd8ed8931cb46461ffb25e73fcab89a35affaeccd')

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
