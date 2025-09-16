# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-markdown
pkgver=0.5.1
pkgrel=1
pkgdesc='Markdown grammar for tree-sitter'
arch=(x86_64)
url=https://github.com/tree-sitter-grammars/tree-sitter-markdown
license=(MIT)
groups=(tree-sitter-grammars)
makedepends=(
  cmake
  git
  tree-sitter-cli
)
optdepends=('tree-sitter: core library')
provides=(
  "lib$pkgname.so"
  "lib$pkgname-inline.so"
)
source=("git+$url.git#commit=v$pkgver")
b2sums=('e72cefd58567a1e76356cceaa2f670286dd1f8eab8df79a58ab885d8dc813b61dde55413b1d1bc6bdfb33e1b98e32014d4e33dd7b47d6c5f494950195a4ddb23')

prepare() {
  cd $pkgname/tree-sitter-markdown
  tree-sitter generate src/grammar.json

  cd ../tree-sitter-markdown-inline
  tree-sitter generate src/grammar.json
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgname"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  install -d "$pkgdir"/usr/lib/tree_sitter
  ln -s /usr/lib/lib$pkgname.so \
    "$pkgdir"/usr/lib/tree_sitter/${pkgname#tree-sitter-}.so
  ln -s /usr/lib/lib$pkgname-inline.so \
    "$pkgdir"/usr/lib/tree_sitter/${pkgname#tree-sitter-}_inline.so

  DESTDIR="$pkgdir" cmake --install build

  cd $pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
