# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-vim
pkgver=0.8.1
pkgrel=1
pkgdesc='Vimscript grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter-grammars/tree-sitter-vim
license=(MIT)
groups=(tree-sitter-grammars)
makedepends=(git)
source=("git+$url.git#tag=v$pkgver")
b2sums=('b57c58b8215ed0e3ef99377348dcfba675f4629b438be5cc84f8c18ecf8b3100468a5280188f0ba36c2f7b916a1f5cfb6984d8353a66fb8878958a3dca146693')

package() {
  cd $pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/tree-sitter/queries/vim queries/vim/*.scm
}
