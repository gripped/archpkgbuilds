# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=tree-sitter
pkgname=(
  tree-sitter
  tree-sitter-cli
)
pkgver=0.23.2
pkgrel=1
arch=(x86_64)
url=https://github.com/tree-sitter/tree-sitter
license=(MIT)
makedepends=(
  git
  rust
)
options=(!lto) # Needed for CLI build
source=("git+$url.git#commit=v$pkgver")
b2sums=('216156115a190270b23075d6e5f155def32444bdfea8a7832bbb4fc1752bb66a374209f18ba9e002807e6a95dab1917cfa46ae5fc34ff697559d6369930ec823')
validpgpkeys=(FCC13F47A6900D64239FF13BE67890ADC4227273) # Amaan Qureshi <amaanq12@gmail.com>

prepare() {
  cd $pkgbase/cli
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgbase
  make PREFIX=/usr LDFLAGS="$LDFLAGS -flto" CFLAGS="$CFLAGS -flto" CXXFLAGS="$CXXFLAGS -flto"

  cd cli
  cargo build --release --locked --offline
}

package_tree-sitter() {
  pkgdesc='Incremental parsing library'
  provides=(libtree-sitter.so)

  cd $pkgbase
  make DESTDIR="$pkgdir" PREFIX=/usr install
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
