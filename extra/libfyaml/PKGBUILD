# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9.2
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/pantoniou/libfyaml#tag=v$pkgver)
sha256sums=('a9850e92d83310631a1aeb0b0ec915d5408cd9a75f4ec1707c39df859492feff')

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
