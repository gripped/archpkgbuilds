# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-c
pkgver=0.21.3
pkgrel=1
pkgdesc='C grammar for tree-sitter'
arch=('x86_64')
url=https://github.com/tree-sitter/tree-sitter-c
license=('MIT')
groups=('tree-sitter-grammars')
makedepends=('git' 'tree-sitter-cli')
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#commit=v$pkgver?signed")
b2sums=('22420c7dc46115ed8be237202b7e6f981a97f7f9fa552d31a189f482d2a49efbffc79b91b49cadce26da7165c64f2dec0035f15b4376c6b421267fda4898c7c2')
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
