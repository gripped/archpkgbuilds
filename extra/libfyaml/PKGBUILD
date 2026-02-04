# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9.4
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/pantoniou/libfyaml#tag=v$pkgver)
sha256sums=('06851d893ae1c66ce2db681f229aa62572a535a3ab67c49354c1b4c622c7c2ec')

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
