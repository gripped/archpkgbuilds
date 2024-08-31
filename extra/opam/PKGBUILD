# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=2.2.1
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
b2sums=('821a9615af52fcde0350bd77b14011589c6c754f9d30024fb52b3c6956d6245831019a8018c3d666319d9f077fdabbb259a7b74c05ae97a99b777343ea9cfa14')

build() {
  cd opam-full-${pkgver%_*}
  ./configure --prefix=/usr --with-mccs --with-vendored-deps
  make all -j1
}

package() {
  make -C opam-full-${pkgver%_*} DESTDIR="$pkgdir" install
}
