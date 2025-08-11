# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=codebook-lsp
pkgver=0.3.8
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
b2sums=('2c50757502ec78dcca58ba9a4f18c9ae9bdb542f80722390738054f58e43cd3c84504786312de786ec55558d07819aacb726454b07554de26c57bfe199a86909')

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
