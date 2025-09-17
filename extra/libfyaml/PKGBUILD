# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/pantoniou/libfyaml#tag=v$pkgver)
sha256sums=('1fcd041e736b6a9bd5f9e4bea1d182573e4db6f2442080b6e9f9a73ece8910ae')

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
