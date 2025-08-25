# Maintainer: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Eric Long <i@hack3r.moe>

pkgname=bpf-linker
pkgver=0.9.15
pkgrel=1
pkgdesc="Simple BPF static linker"
arch=('x86_64')
url="https://github.com/aya-rs/bpf-linker"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs' 'llvm-libs')
makedepends=('cargo' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aya-rs/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90e53daa07e0f047a0ef91042a69417d0b0fa961ce9a6afe1d8fbf9f0f048fc1')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"

  # skipping compile_test:
  # failed to build sysroot: "/usr/lib/rustlib/src/rust/library" does not seem to be a rust library
  # source folder: `src/Cargo.toml` not found
  CARGO_MANIFEST_DIR="$PWD" cargo test --frozen \
    -- --skip compile_test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-{APACHE,MIT} -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
