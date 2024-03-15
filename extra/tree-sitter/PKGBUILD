# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgbase=tree-sitter
pkgname=('tree-sitter' 'tree-sitter-cli')
_commit=1c38d34deac5ae7ea797a559f596fb4ec9008eb4
pkgver=0.22.1
pkgrel=2
arch=('x86_64')
url=https://github.com/tree-sitter/tree-sitter
license=('MIT')
makedepends=('git' 'rust')
options=('!lto') # Needed for CLI build
source=("git+$url.git#commit=$_commit?signed")
b2sums=('SKIP')
validpgpkeys=('FCC13F47A6900D64239FF13BE67890ADC4227273') # Amaan Qureshi <amaanq12@gmail.com>

prepare() {
  cd $pkgbase/cli
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgbase
  make LDFLAGS="$LDFLAGS -flto" CFLAGS="$CFLAGS -flto" CXXFLAGS="$CXXFLAGS -flto"

  cd cli
  cargo build --release --locked --offline
}

package_tree-sitter() {
  pkgdesc='Incremental parsing library'
  provides=('libtree-sitter.so')

  cd $pkgbase
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}

package_tree-sitter-cli() {
  pkgdesc='CLI tool for developing, testing, and using Tree-sitter parsers'
  depends=('gcc-libs')
  optdepends=('nodejs: for the generate subcommand')

  cd $pkgbase
  install -Dt "$pkgdir"/usr/bin target/release/$pkgbase
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgbase}-cli LICENSE
}
