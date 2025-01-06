# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=tree-sitter
pkgname=(
  tree-sitter
  tree-sitter-cli
)
pkgver=0.24.6
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
b2sums=('082b8d803d5ba89f9320dcba91d524245c2bfb51c94b72e7d8aeab0514b16b5735cd85e8183f7102415d10d8c78fcce5284164d077361636b37f4f52538e5a8e')
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
