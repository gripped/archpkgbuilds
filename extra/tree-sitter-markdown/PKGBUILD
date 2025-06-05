# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: ObserverOfTime <chronobserver@disroot.org>

pkgname=tree-sitter-markdown
pkgver=0.5.0
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
b2sums=('3e64a5e8478d10c069c97f549f3a5b62573c081bfef39ce699187bf286c16dca1964e2b5f2d6d7c83faf0df45b7f0930c8324a9822fd5e59c81bb69bacb3659d')
#validpgpkeys=(C3FC4EB6371B04CC6DDB9EA88A2DEA1DBAEBCA9E) # ObserverOfTime <chronobserver@disroot.org>

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
