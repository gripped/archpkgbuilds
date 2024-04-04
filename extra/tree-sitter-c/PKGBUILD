# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-c
pkgver=0.21.0
pkgrel=2
pkgdesc='C grammar for tree-sitter'
arch=('x86_64')
url=https://github.com/tree-sitter/tree-sitter-c
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli')
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#commit=v$pkgver?signed")
b2sums=('8033143041a51a64c3d0bdc6eb401082f5423d4fb1a1da2762f07b205e9b9d97e01eba25b4964ab8963c04d81d7eb971743d7fed54de7c6329c2798293a1be7a')
validpgpkeys=('FCC13F47A6900D64239FF13BE67890ADC4227273') # Amaan Qureshi <amaanq12@gmail.com>

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
