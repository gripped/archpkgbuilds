# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=treemd
pkgver=0.5.9
pkgrel=1
pkgdesc="A markdown navigator with tree-based structural navigation"
arch=('x86_64')
url="https://github.com/Epistates/treemd"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e47c8621f5f4bd3930aace0847ec46b6bba9205ef6116a0cf8f6069f783e9dcf')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
