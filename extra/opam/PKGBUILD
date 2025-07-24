# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=2.4.1
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
source=("https://github.com/ocaml/opam/releases/download/${pkgver%_*}/opam-full-${pkgver/_/-}.tar.gz")
b2sums=('5b2fbca21955c4ce88ab4ef05e7cabe32e4fe9b787b333a1641e735b440ffc1b0b6c3f4c3e4cc3fbe13265ca39c6a896067553a6db4fc0d5ee09aa76106160d5')

build() {
  cd opam-full-${pkgver%_*}
  ./configure --prefix=/usr --with-mccs --with-vendored-deps
  make all -j1
}

package() {
  make -C opam-full-${pkgver%_*} DESTDIR="$pkgdir" install
}
