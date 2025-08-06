# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=codebook-lsp
pkgver=0.3.7
pkgrel=1
pkgdesc='Code-aware spell checker with language server implementation'
arch=(x86_64)
url=https://github.com/blopker/codebook
license=(MIT)
depends=(gcc-libs)
makedepends=(
  git
  rust
)
options=(!lto)
source=("git+$url.git#tag=v$pkgver")
b2sums=('32d5329cec37f43ddbae0990a7a69d822e59b015a3075c885cc3e8e344777bae96a7b92143f2b32f52ceed8c3924911b86541a8c771a1a495902653c16b65ce0')

prepare() {
  cd codebook
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd codebook
  cargo build --release --locked --offline
}

check() {
  cd codebook
  cargo test --locked --offline
}

package() {
  cd codebook
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
