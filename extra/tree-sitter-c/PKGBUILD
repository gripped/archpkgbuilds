# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-c
pkgver=0.23.4
pkgrel=1
pkgdesc='C grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter/tree-sitter-c
license=(MIT)
groups=(tree-sitter-grammars)
makedepends=(
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=("lib$pkgname.so")
source=("git+$url.git#commit=v$pkgver?signed")
b2sums=('3072ea4690bef7da4a3753ef69131f0f83767a93798deee2c915f18fccd2c25d3b93b096c9f7ded4a5b4c08bbafc3ef416e561deefc0d599119a36b34e4e9d18')
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
