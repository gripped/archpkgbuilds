# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=codebook-lsp
pkgver=0.3.6
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
b2sums=('351d09d8c3a8b6d3e7799208457af7b008e4b43ef4783897265a724f5fe50f395d2fe75dba00bd87bdaff61e814e29bf998777793eeb3fe7a7b88aa8908c7f93')

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
