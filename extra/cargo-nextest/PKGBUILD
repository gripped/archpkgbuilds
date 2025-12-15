# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-nextest
pkgver=0.9.115
pkgrel=1
pkgdesc="A next-generation test runner for Rust."
arch=('x86_64')
url="https://github.com/nextest-rs/nextest"
license=('Apache-2.0' 'MIT')
depends=('cargo' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/cargo-nextest-$pkgver.tar.gz")
sha256sums=('b1a48bb44561f16b4a7f84bd3c2435b7d2016b8cbe4aec085a2c2bb9a7f54294')
b2sums=('d222d845de6a43e26e3085486160b56e31aa0363a25b9eb44202fb663baaf232ec64f5f3a6d86af5702d018d9a0b2e1f189d47ef8d4ac8be96635cfbda2c35f1')
options=('!lto')

prepare() {
  mv "nextest-$pkgname-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --package "$pkgname" --no-default-features --features default-no-update
}

check() {
  cd "$pkgname-$pkgver"
  cargo run --package cargo-nextest -- nextest run -- --skip test_version_info
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
