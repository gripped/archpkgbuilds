# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=tree-sitter
pkgname=(
  tree-sitter
  tree-sitter-cli
)
pkgver=0.25.9
pkgrel=1
arch=(x86_64)
url=https://github.com/tree-sitter/tree-sitter
license=(MIT)
makedepends=(
  cmake
  git
  rust
)
options=(!lto) # Needed for CLI build
source=("git+$url.git#commit=v$pkgver")
b2sums=('1d2c3497520f6695bd647cf01b61e19dafdcb6858969a0bbae9b54b6014751440cb7b0f2747acd8252449c6fec78ba9350ad34be6c11bece96e030f6d3857d4e')
validpgpkeys=(FCC13F47A6900D64239FF13BE67890ADC4227273) # Amaan Qureshi <amaanq12@gmail.com>

prepare() {
  cd $pkgbase/cli
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgbase
  cmake -S lib -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON # Enable LTO
  cmake --build build

  cd cli
  cargo build --release --locked --offline
}

package_tree-sitter() {
  pkgdesc='Incremental parsing library'
  provides=(libtree-sitter.so)

  cd $pkgbase
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}

package_tree-sitter-cli() {
  pkgdesc='CLI tool for developing, testing, and using Tree-sitter parsers'
  depends=(gcc-libs)
  optdepends=('nodejs: for the generate subcommand')

  cd $pkgbase
  install -Dt "$pkgdir"/usr/bin target/release/$pkgbase
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgbase}-cli LICENSE
}
