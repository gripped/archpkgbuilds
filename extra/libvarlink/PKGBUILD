# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: emersion <contact emersion fr>

pkgname=libvarlink
pkgver=24
pkgrel=1
license=('MIT')
pkgdesc='Varlink C library and command line tool'
makedepends=('meson')
arch=('x86_64')
url='https://github.com/varlink/libvarlink'
source=("https://github.com/varlink/libvarlink/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0586263ab8f4e8e26a2f2f54830f8f92e403326663b10e14fcf1a6c95e9eab95')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build/
  ninja -C build/

  # convert thin archive to fat one
  ar -t build/lib/libvarlink.a | xargs ar rs build/lib/libvarlink.a.new
  mv build/lib/libvarlink.a{.new,}
}

check() {
  cd "$pkgname-$pkgver"
  ninja -vC build/ test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  DESTDIR="$pkgdir/" ninja -C build/ install
}
