# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-tools
pkgver=1.251.0
pkgrel=1
pkgdesc="Low level tooling for WebAssembly in Rust"
arch=("x86_64")
url="https://github.com/bytecodealliance/wasm-tools"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
# Update using ./retrieve-testsuite-commit.sh <pkgver>
_wasm_testsuite_commit=51279a9d02cbba193cb25142d115388d7b83299c
makedepends=("cargo")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"wasm-testsuite-$_wasm_testsuite_commit.tar.gz::https://github.com/WebAssembly/testsuite/archive/$_wasm_testsuite_commit.tar.gz"
)
sha256sums=('111f529d3cb72d378cd7c162e3e707997c53275ac9abd3b355dbd518f3905bff'
            '1b3caa3fab5259b1e1cda8c66d14ee8c81f5e0dc6322f518964c0c6f6590d945')

options_aarch64=(!lto)

prepare() {
    cd "$pkgname-$pkgver"
    rm -r tests/testsuite
    cp -r "$srcdir/testsuite-$_wasm_testsuite_commit" tests/testsuite
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
