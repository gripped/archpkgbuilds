# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: greyltc (AUR)

pkgname=wasm-component-ld
pkgver=0.5.25
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
b2sums=('7e63c64c8d6de10b0eb559e240dfde78a28d4319dff52b627607415ce9b75caebbbbcf10606403f5fb91662a662a0227c09f7427cde684c08a9489d4ad4a4370')

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
