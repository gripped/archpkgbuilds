# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=treemd
pkgver=0.5.2
pkgrel=1
pkgdesc="A markdown navigator with tree-based structural navigation"
arch=('x86_64')
url="https://github.com/Epistates/treemd"
license=('MIT')
depends=('gcc-libs' 'oniguruma')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('096b9f17a5801f7d2e1ab9ebc4dd4eb63e70d5f587a3dfe067fd53fef8cffb12')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
