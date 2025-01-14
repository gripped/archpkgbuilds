# Maintainer: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Armin K. <krejzi at email dot com>

pkgname=ocaml-ctypes
pkgver=0.23.0
pkgrel=1
pkgdesc="Library for binding to C libraries using pure OCaml"
arch=('x86_64')
url="https://github.com/ocamllabs/ocaml-ctypes"
license=('MIT')
depends=('ocaml' 'libffi' 'ocaml-integers' 'ocaml-bigarray-compat')
makedepends=('ocaml-findlib' 'ocaml-compiler-libs' 'dune')
options=('!strip' '!makeflags' '!debug')
source=($pkgname-$pkgver.tar.gz::https://github.com/yallop/ocaml-ctypes/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('0c287cd3162d092b37bd6d4b24c196d41c93b792c4aa77938fde60f5dbc7eedde588097493a645af9bffc0ed722eadd0fa90e04b04d5e36e78e6467ae9e4baf8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  dune build -p ctypes,ctypes-foreign
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="${pkgdir}" dune install --prefix "/usr" --libdir "/usr/lib/ocaml" --docdir "/usr/share/doc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
