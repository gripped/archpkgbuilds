# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=2.6.0
pkgrel=1
pkgdesc='OCaml package manager'
arch=(x86_64)
url='https://opam.ocaml.org/'
license=(LGPL-2.1-only)
depends=(bubblewrap libgcc libstdc++ glibc ocaml-compiler-libs unzip)
makedepends=(git)
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
source=("https://github.com/ocaml/opam/releases/download/${pkgver%_*}/opam-full-${pkgver/_/-}.tar.gz")
b2sums=('c3c4e995222a2cb967354678c41d12298f76383bc142b5987b5f9a8f619da3e48b1ab8293e45e338fd7e6b1a08e10618cb4ab56e2a1113a6b132f3abde20ce38')

build() {
  cd opam-full-${pkgver%_*}
  ./configure --prefix=/usr --with-mccs --with-vendored-deps
  make all -j1
}

package() {
  make -C opam-full-${pkgver%_*} DESTDIR="$pkgdir" install
}
