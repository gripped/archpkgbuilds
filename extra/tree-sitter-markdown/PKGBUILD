# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-markdown
pkgver=0.3.1
pkgrel=1
pkgdesc='Markdown grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter-grammars/tree-sitter-markdown
license=(MIT)
groups=(tree-sitter-grammars)
makedepends=(
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=(
  "lib$pkgname.so"
  "lib$pkgname-inline.so"
)
source=("git+$url.git#commit=v$pkgver?signed")
b2sums=('a7378a02a71e1115badcec8be2466d249d52485ab30511c18fe90e23d059d02ce0875d365ff26a97a66d4025a28d8d1bb242ebb8f81b85b930fb6b40687b780e')
validpgpkeys=(C3FC4EB6371B04CC6DDB9EA88A2DEA1DBAEBCA9E) # ObserverOfTime <chronobserver@disroot.org>

prepare() {
  cd $pkgname/tree-sitter-markdown
  tree-sitter generate --no-bindings src/grammar.json

  cd ../tree-sitter-markdown-inline
  tree-sitter generate --no-bindings src/grammar.json
}

build() {
  cd $pkgname
  make PREFIX=/usr PARSER_URL=$url
}

package() {
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib$pkgname.so \
    "$pkgdir"/usr/lib/tree_sitter/${pkgname#tree-sitter-}.so
  ln -s /usr/lib/lib$pkgname-inline.so \
    "$pkgdir"/usr/lib/tree_sitter/${pkgname#tree-sitter-}_inline.so

  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
