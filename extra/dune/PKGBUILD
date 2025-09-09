# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=dune
pkgver=3.20.2
pkgrel=1
pkgdesc="A composable build system for OCaml (formerly jbuilder)"
arch=(x86_64)
url="https://github.com/ocaml/dune"
license=('MIT')
depends=('glibc')
makedepends=('git' 'ocaml' 'ocaml-compiler-libs' 'ocaml-csexp' 'ocaml-pp' 'ocaml-findlib')
optdepends=('ocaml: Dune standard library')
source=("git+https://github.com/ocaml/dune.git#tag=$pkgver")
b2sums=('e42172e2ba896bb034630604a1523836e74bb3c4d766039f0f07986ca58da2c29d30954d653fdbb501117c020645c0115664458047dc9de7e7413b455d3d5e95')

_dune_release_pkgs=('dune' 'dune-action-plugin' 'dune-build-info' 'dune-configurator' 'dune-glob' 'dune-private-libs'
                    'dune-site' 'dune-rpc' 'dyn' 'stdune' 'ordering' 'xdg' 'chrome-trace' 'ocamlc-loc')

build() {
    cd dune

    # FS#74061
    ./configure --libdir /usr/lib/ocaml

    make _boot/dune.exe  # this runs `ocaml bootstrap.ml`, but keeps upstream's choice

    # dune build needs a comma separated list of packages
    local dune_release_pkgs='dummy'
    for _pkg in "${_dune_release_pkgs[@]}"; do
      dune_release_pkgs+=",${_pkg}"
    done
    dune_release_pkgs="${dune_release_pkgs#dummy,}"
    echo "Building packages: ${dune_release_pkgs}"

    ./dune.exe build -p "${dune_release_pkgs}" --profile dune-bootstrap
}

# Tests require a bunch of (currently) unpackaged dependencies
# check() {
#     cd dune
#     make test
# }

package() {
    cd dune

    # we need to install packages one by one
	for _pkg in "${_dune_release_pkgs[@]}"; do
      ./dune.exe install "${_pkg}" --destdir="${pkgdir}" --prefix="/usr" --libdir="$(ocamlfind printconf destdir)"
    done

    # Fix doc and man install
    install -d "${pkgdir}"/usr/share
    mv "${pkgdir}"/usr/{doc,share/}
    mv "${pkgdir}"/usr/{man,share/}
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/pp/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
