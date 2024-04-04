# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-query
pkgver=0.2.1
pkgrel=2
pkgdesc='TS query grammar for tree-sitter'
arch=('x86_64')
url=https://github.com/tree-sitter-grammars/tree-sitter-query
license=('Apache-2.0')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli')
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#tag=v$pkgver")
b2sums=('bf105d39773fdd8d2ad289463a6d37e20b723fc521de51f025535b065a7418618c90954e4f4214d50dfa45936b274c0f65b2e1389267256041477398bce2b87e')

prepare() {
  cd $pkgname
  tree-sitter generate --no-bindings src/grammar.json
}

build() {
  cd $pkgname
  make PREFIX=/usr PARSER_URL="$url"
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
