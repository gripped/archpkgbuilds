# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: greyltc (AUR)

pkgname=wasm-component-ld
pkgver=0.5.19
pkgrel=1
pkgdesc="Command line linker for creating WebAssembly components"
url="https://github.com/bytecodealliance/wasm-component-ld"
arch=(x86_64)
license=('Apache-2.0 WITH LLVM-exception AND Apache-2.0 AND MIT')
depends=(
  gcc-libs
  glibc
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
b2sums=('a81dccd6e43ac9417452ff55090b8a8e01b0cf4a2646ba557ba332178ad00daf9bffd0c871ea16e267a4eece056f34d00e4c537538197cc8be5e8c8fd715cab4')

prepare() {
  cd wasm-component-ld
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd wasm-component-ld

  # Use debug
  export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

  # Use LTO
  export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

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
