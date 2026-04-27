# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vincent B. <vb@luminar.eu.org>

pkgname=opam
pkgver=2.5.1
pkgrel=1
pkgdesc='OCaml package manager'
arch=(x86_64)
url='https://opam.ocaml.org/'
license=(LGPL-2.1-only)
depends=(bubblewrap gcc-libs glibc ocaml-compiler-libs unzip)
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
source=("https://github.com/ocaml/opam/releases/download/${pkgver%_*}/opam-full-${pkgver/_/-}.tar.gz")
b2sums=('b8cb458f8e4851e0d1386ae5d92ef7e92682fcac234dcac948882c0dd67acb128c8b4901662b9448a74784b885bfa63b380e4101b80904c3f6aefa3ed5d0775b')

build() {
  cd opam-full-${pkgver%_*}
  ./configure --prefix=/usr --with-mccs --with-vendored-deps
  make all -j1
}

package() {
  make -C opam-full-${pkgver%_*} DESTDIR="$pkgdir" install
}
