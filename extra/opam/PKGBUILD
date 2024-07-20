# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=2.2.0
pkgrel=1
pkgdesc='OCaml package manager'
arch=(x86_64)
url='https://opam.ocaml.org/'
license=(LGPL-2.1-only)
depends=(bubblewrap ocaml-compiler-libs unzip)
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
source=("https://github.com/ocaml/opam/releases/download/$pkgver/opam-full-$pkgver.tar.gz")
b2sums=('0ee3e4d96319a2e722362abd5d149838fb931bfdb22f4a85f5681142519afa1508c9fac1d0391de1d7c81ed5b2f3e2f3c402c8e3fc82e8ffbf61fb5b3596f8d9')

build() {
  cd opam-full-$pkgver
  ./configure --prefix=/usr --with-vendored-deps
  make all OCAMLC='ocamlc -unsafe-string -w -a' OCAMLOPT='ocamlopt -unsafe-string -w -a'
}

package() {
  make -C opam-full-$pkgver DESTDIR="$pkgdir" install
}
