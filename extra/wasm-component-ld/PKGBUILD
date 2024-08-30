# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: greyltc (AUR)

pkgname=wasm-component-ld
pkgver=0.5.7
pkgrel=1
pkgdesc="Command line linker for creating WebAssembly components"
arch=(x86_64)
url="https://github.com/bytecodealliance/wasm-component-ld"
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
checkdepends=(rust-wasm)
source=("git+$url#tag=v$pkgver")
b2sums=('73c09e6c4134ce1d5ea948754112e1df1fb19a8bb109e9b529ddbdd52a239d813c6b328a53062ea778a34fd2cf7a78a980bb4a2a2ad16f43c20469a3df9cbf5e')

prepare() {
  cd wasm-component-ld
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd wasm-component-ld

  # Use debug
  export CARGO_PROFILE_RELEASE_DEBUG=2

  # Use LTO
  export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

  cargo build --release --frozen --all-targets
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
