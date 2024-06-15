# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=2.1.6
pkgrel=1
pkgdesc='OCaml package manager'
arch=(x86_64)
url='https://opam.ocaml.org/'
license=(GPL)
depends=(bubblewrap ocaml-compiler-libs unzip)
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
source=("https://github.com/ocaml/opam/releases/download/$pkgver/opam-full-$pkgver.tar.gz")
b2sums=('20e74551760cadf1d911e72c34502e1e7e62003f8ebc83f3b9cb46c712e13fb5f85f41421cc74b051c2e348e0c0a17f4ea34bf655f7ec48cfcdab1e0d8a57a11')

build() {
  cd opam-full-$pkgver
  ./configure --prefix=/usr
  make lib-ext all -j1 \
    OCAMLC='ocamlc -unsafe-string' \
    OCAMLOPT='ocamlopt -unsafe-string'
}

package() {
  make -C opam-full-$pkgver DESTDIR="$pkgdir" install
}
