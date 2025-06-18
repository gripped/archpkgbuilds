# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-query
pkgver=0.6.2
pkgrel=1
pkgdesc='TS query grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter-grammars/tree-sitter-query
license=(Apache-2.0)
groups=(tree-sitter-grammars)
makedepends=(
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#tag=v$pkgver")
b2sums=('7aa9b1e46340348ca256bdac4a31864f8ac0fd0d78888b80229ee143d032dfac1d7293f55f3b48127a4de70823ce680165b2cbe15a93a82fce1efab84f03ae6d')

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
