# Maintainer: Jürgen Hötzel <juergen@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=dune
pkgver=3.25.0
pkgrel=1
pkgdesc="A composable build system for OCaml (formerly jbuilder)"
arch=(x86_64)
url="https://github.com/ocaml/dune"
license=('MIT')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'ocaml-pp' 'ocaml-re')
makedepends=('git' 'ocaml-compiler-libs' 'ocaml-findlib')
optdepends=()
provides=('dune-configurator')
source=("git+https://github.com/ocaml/dune.git#tag=${pkgver}")
sha256sums=('4af89ce483c6df5d828d09d06dec8cc8f0f9077d1825305dc476f088fcd735c3')

# Packages to install from the dune release
_dune_release_pkgs=(
    'dune'
    'dune-build-info'
    'dune-configurator'
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

prepare() {
    cd "${srcdir}/dune"
    # Git checkouts lack the release archive's package version metadata.
    sed -i "/^(name dune)$/a (version ${pkgver})" dune-project
}

build() {
    cd "${srcdir}/dune"
    local IFS=,

    ./configure --prefix=/usr --libdir=/usr/lib/ocaml
    make ./_boot/dune.exe
    ./_boot/dune.exe build "${_dune_release_pkgs[@]/%/.install}" -p "${_dune_release_pkgs[*]}" --profile dune-bootstrap
}

# Tests require a bunch of (currently) unpackaged dependencies
#check() {
#    cd "${srcdir}/dune"
#    make test
#}

package() {
    cd "${srcdir}/dune"
    local IFS=,

    # Install main dune
    make install DESTDIR="${pkgdir}"

    # Install additional packages
    ./dune.exe install -p "${_dune_release_pkgs[*]}" --destdir="${pkgdir}" --prefix=/usr --libdir=/usr/lib/ocaml

    # Fix doc and man install
    install -d "${pkgdir}"/usr/share
    mv -v  "${pkgdir}"/usr/{doc,share/}
    mv -v "${pkgdir}"/usr/{man,share/}

    # Install license
    install -Dm644 "${srcdir}/dune/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
