# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=codebook-lsp
pkgver=0.3.5
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
b2sums=('af9a049011e1424964c9981eedb95afb4a0abaff8c5fb5aa45fb889e5121467226403080d7bc07f5369110bbeda671f2d24a0cc230ab9a7a62040cd0b7a8f942')

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
