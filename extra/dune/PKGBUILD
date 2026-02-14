# Maintainer: Jürgen Hötzel <juergen@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=dune
pkgver=3.21.1
pkgrel=1
pkgdesc="A composable build system for OCaml (formerly jbuilder)"
arch=(x86_64)
url="https://github.com/ocaml/dune"
license=('MIT')
depends=('glibc' 'ocaml')
makedepends=('git' 'ocaml-re' 'ocaml-compiler-libs' 'ocaml-csexp' 'ocaml-pp' 'ocaml-findlib')
optdepends=()
provides=('dune-configurator')
source=("https://github.com/ocaml/dune/releases/download/${pkgver}/dune-${pkgver}.tbz")
sha256sums=('84f7a82c6d80a7124f3847e9a489e80cfbeafb7bed3573ac01286ef56fd08d94')

# Packages to install from the dune release
_dune_release_pkgs=(
    'dune'
    'dune-action-plugin'
    'dune-build-info'
    'dune-configurator'
    'dune-glob'
    'dune-private-libs'
    'dune-rpc'
    'dune-site'
    'chrome-trace'
    'dyn'
    'fs-io'
    'ordering'
    'stdune'
    'xdg'
    'top-closure'
    'ocamlc-loc'
)
build() {
    cd "${srcdir}/dune-${pkgver}"
    ./configure --prefix=/usr --libdir=/usr/lib/ocaml
    make ./_boot/dune.exe
    ./_boot/dune.exe build @install -p $(printf '%s,' "${_dune_release_pkgs[@]}" | sed 's/,$//') --profile dune-bootstrap
}

# Tests require a bunch of (currently) unpackaged dependencies
#check() {
#    cd "${srcdir}/dune-${pkgver}"
#    make test
#}

package() {
    cd "${srcdir}/dune-${pkgver}"

    # Install main dune
    make install DESTDIR="${pkgdir}"

    # Install additional packages
    ./dune.exe install -p $(printf '%s,' "${_dune_release_pkgs[@]}" | sed 's/,$//') --destdir="${pkgdir}" --prefix=/usr --libdir=/usr/lib/ocaml

    # Fix doc and man install
    install -d "${pkgdir}"/usr/share
    mv -v  "${pkgdir}"/usr/{doc,share/}
    mv -v "${pkgdir}"/usr/{man,share/}

    # Install license
    install -Dm644 "${srcdir}/dune-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
