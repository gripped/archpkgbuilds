# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: greyltc (AUR)

pkgname=wasm-component-ld
pkgver=0.5.8
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
b2sums=('640ecd669463e3dc78922288be16084aae3de69adb48ce1eac9b7fd1ccedd864d02edac50bdd477e76b24440a38dc9de32e361d612b3bf2208fdb316b6370952')

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
