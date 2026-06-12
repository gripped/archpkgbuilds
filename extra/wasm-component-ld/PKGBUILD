# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: greyltc (AUR)

pkgname=wasm-component-ld
pkgver=0.5.24
pkgrel=1
pkgdesc="Command line linker for creating WebAssembly components"
url="https://github.com/bytecodealliance/wasm-component-ld"
arch=(x86_64)
license=('Apache-2.0 WITH LLVM-exception AND Apache-2.0 AND MIT')
depends=(
  glibc
  libgcc
  lld
)
makedepends=(
  cargo
  git
)
checkdepends=(
  rust-wasm
)
options=(!lto)
source=("git+$url#tag=v$pkgver")
b2sums=('42acdaaa35cb43c5ca06ed6ab96727cf6831996d898fb29d89b489ffa7e1cfb2cc2bf74f735af40834585024c133ef7d1e768efd366d122d211c869fd38c93cf')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd wasm-component-ld
  cargo fetch --locked --target host-tuple
}

build() {
  cd wasm-component-ld
  cargo build --release --frozen
}

check() {
  cd wasm-component-ld
  cargo test --frozen
}

package() {
  cd wasm-component-ld
  install -D target/release/wasm-component-ld -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
