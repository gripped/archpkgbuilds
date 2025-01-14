# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Jürgen Hötzel <juergen@hoetzel.info>

pkgname=ocamlbuild
pkgver=0.15.0
pkgrel=2
pkgdesc='Build tool that has built-in rules for building OCaml libraries and programs'
arch=(x86_64)
license=(GPL-2.0-only)
url='https://github.com/ocaml/ocamlbuild'
depends=(ocaml zstd)
options=(!makeflags)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
b2sums=('34c35c48d446d9c5297a9eabf6d4f134fbfdf01aad4eff15804ad7ecd9068527a70c2d9820ce3f7dba41aa88dda215e82074ad0c66df048c512afd60884ec7fd')

build() {
  cd $pkgname-$pkgver
  make configure PREFIX=/usr MANDIR=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
