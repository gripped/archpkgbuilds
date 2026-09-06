# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Maintainer: Orhun Parmaksız <orhun@archlinux.org>

pkgname=rust-bindgen
_pkgname=bindgen
pkgver=0.73.0
pkgrel=1
pkgdesc='Automatically generates Rust FFI bindings to C (and some C++) libraries'
url='https://github.com/rust-lang/rust-bindgen'
depends=('libgcc' 'glibc' 'clang')
makedepends=('cargo')
arch=('x86_64')
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-lang/rust-bindgen/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e13a8946888fd9756e10718567d8ba065962ba310104b7aaab5d108ac42607cf6c68e785643d728ddd7ba5a2f7f624bcbccd82b4cab1e1c7142f53696f716d57')

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use LTO
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target host-tuple
  mkdir -p completions
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --frozen
  local _completion="target/release/$_pkgname --generate-shell-completions"
  $_completion bash >"completions/$_pkgname"
  $_completion fish >"completions/$_pkgname.fish"
  $_completion zsh >"completions/_$_pkgname"
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "target/release/$_pkgname" "$pkgdir"/usr/bin/bindgen
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm664 "completions/$_pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm664 "completions/$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm664 "completions/_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
