# Maintainer:  Jürgen Hötzel <juergen@archlinux.org>
pkgname=ocaml-topkg
pkgver=1.0.8
pkgrel=1
pkgdesc="A packager for distributing OCaml software"
arch=('x86_64')
url="https://erratique.ch/software/topkg"
license=('BSD')
depends=('ocaml' 'ocaml-result')
makedepends=('ocaml-findlib' 'ocamlbuild' 'opam' 'ocaml-compiler-libs')
source=("https://erratique.ch/software/topkg/releases/topkg-${pkgver}.tbz")
sha512sums=('4b632b60137852bb72ff9c8cdc2e16ac5ece6473569e50963fef9c1e800a0933a516bea1107b04011645afa4a1e78893c82dbce0aa8de2970d4d6c6d0dd2fe02')

build() {
  cd "${srcdir}/topkg-${pkgver}"

  pkg/pkg.ml build --pkg-name topkg
}

package() {
  cd "${srcdir}/topkg-${pkgver}"

  opam-installer --prefix="${pkgdir}/usr" \
    --libdir="${pkgdir}$(ocamlc -where)" \
    --docdir="${pkgdir}/usr/share/doc"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/topkg/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
