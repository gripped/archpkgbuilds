# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-tools
pkgver=1.263.0
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache-2.0")
depends=(
  "glibc"
  "libgcc"
)
# Update using ./retrieve-testsuite-commit.sh <pkgver>
_wasm_testsuite_commit=44f1503f98409fa3737437bf9449a37a5def4210
_component_model_testsuite_commit=1a743de691c5966a217efcf58fef9cd68dacc754
makedepends=("cargo")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"wasm-testsuite-$_wasm_testsuite_commit.tar.gz::https://github.com/WebAssembly/testsuite/archive/$_wasm_testsuite_commit.tar.gz"
	"component-model-testsuite-$_component_model_testsuite_commit.tar.gz::https://github.com/WebAssembly/component-model/archive/$_component_model_testsuite_commit.tar.gz"
)
sha256sums=('2c5eaf1006b7302c154c9aefb19bb30bad480ccc4e45cf3c6395ae9dc8073058'
            '4739e6f62ec65c450d8c9b9f0d3910bfdcc505d14cb9f5eb65b0e13e17eb8231'
            'bad90677a64a60fcdc570c21b64818812ae1f21987b66d6b3cbd93a815275309')

options_aarch64=(!lto)

prepare() {
    cd "$pkgname-$pkgver"
    rm -r tests/testsuite
    rm -r tests/component-model
    cp -r "$srcdir/testsuite-$_wasm_testsuite_commit" tests/testsuite
    cp -r "$srcdir/component-model-$_component_model_testsuite_commit" tests/component-model
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features --bin wasm-tools
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
