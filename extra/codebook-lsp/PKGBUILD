# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=codebook-lsp
pkgver=0.3.4
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
b2sums=('555abc36d7fe0fc0b502d68c2a01996f0cad670d1b41fe983153bebee64759be5df825bcf0422d436835d84bd99465ad37af5d7116087cf8190dcaaa21905196')

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
