# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-python
pkgver=0.23.2
pkgrel=1
pkgdesc='Python grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter/tree-sitter-python
license=(MIT)
groups=(tree-sitter-grammars)
makedepends=(
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#tag=v$pkgver")
b2sums=('f7ac122f91d0301f9cb6cc3a5ea61e05c422d71014ff57317f6e00a5bc8974451e64912218cb9c96d2f9bbc633e1fd9f905fc8b710d13cc18d2ae88bd3b2c680')

prepare() {
  cd $pkgname
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

  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
