# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-vimdoc
pkgver=4.0.0
pkgrel=1
pkgdesc='Vim help file grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/neovim/tree-sitter-vimdoc
license=(Apache-2.0)
groups=(tree-sitter-grammars)
makedepends=(
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#tag=v$pkgver")
b2sums=('a40ef9bb81f25cc63a1d7a2d079bd4b6ee2235882b04a5f74c2574e1fc9d9abb1890efdb5de69f33fcd2212e57cc4cec540599e9b791f79ea2a8234d9326eecb')

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
