# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-bash
pkgver=0.23.3
pkgrel=1
pkgdesc='Bash grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter/tree-sitter-bash
license=(MIT)
groups=(tree-sitter-grammars)
makedepends=(
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#commit=v$pkgver?signed")
b2sums=('90deca5b95088cc90e70717b83c67cb10987683b1138a321127abfcfd8f5a0b5de1d652957b86b356d2f645f5849423fc606c9011d536c6291d99981d7144be5')
validpgpkeys=(FCC13F47A6900D64239FF13BE67890ADC4227273) # Amaan Qureshi <amaanq12@gmail.com>

prepare() {
  cd $pkgname
  tree-sitter generate src/grammar.json
}

build() {
  cd $pkgname
  make PREFIX=/usr PARSER_URL=$url
}

package() {
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib$pkgname.so \
    "$pkgdir"/usr/lib/tree_sitter/${pkgname#tree-sitter-}.so

  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
